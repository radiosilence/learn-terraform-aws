import { GetCommand, PutCommand } from "@aws-sdk/lib-dynamodb";
import { APIGatewayProxyHandler } from "aws-lambda";
import { ddbDocClient } from "../../libs/ddbDocClient";

export const handler: APIGatewayProxyHandler = async (event, context) => {
  const debug = { event, context, env: process.env };
  console.log("Running handler", debug);

  const TableName = process.env.TABLE_potato;
  if (!TableName) {
    throw new Error("TABLE_potato is not defined");
  }

  console.log("TableName", TableName);

  const name = event.pathParameters?.name ?? "world";

  console.log("name", name);
  console.log("Sending GetCommand...");
  const data = await ddbDocClient.send(
    new GetCommand({ TableName, Key: { primaryKey: name } })
  );

  console.log("Got data", data);
  const Item = data?.Item ?? { id: name, count: 1 };

  // NOTE: Not atomic/concurrency safe in any way
  if (data.Item) {
    Item.count += data.Item.count;
  }

  console.log("Sending PutCommand...");
  await ddbDocClient.send(new PutCommand({ TableName, Item }));

  return {
    statusCode: 200,
    headers: {
      "content-type": "application/json",
    },
    body: JSON.stringify({
      message: `hello ${event.pathParameters?.name ?? "world"}!`,
      queryStringParameters: event.queryStringParameters,
      pathParameters: event.pathParameters,
      data: Item,
      oldData: data?.Item,
      tables: {
        potato: TableName,
      },
    }),
  };
};
