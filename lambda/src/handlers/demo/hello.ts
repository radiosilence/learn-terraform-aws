import { GetCommand, UpdateCommand } from "@aws-sdk/lib-dynamodb";
import { APIGatewayProxyHandler } from "aws-lambda";
import { ddbDocClient } from "../../clients/ddbDocClient";

export const handler: APIGatewayProxyHandler = async (event, context) => {
  const debug = { event, context, env: process.env };
  console.log("Running handler", debug);

  const TableName = process.env.TABLE_visitors;
  if (!TableName) {
    throw new Error("TABLE_visitors is not defined");
  }

  console.log("TableName", TableName);

  const name = event.pathParameters?.name ?? "world";

  console.log("name", name);
  console.log("Sending GetCommand...");
  await ddbDocClient.send(
    new UpdateCommand({
      TableName,
      Key: { name },
      UpdateExpression: "set #count = if_not_exists(#count, :zero) + :incr",
      ExpressionAttributeNames: {
        "#count": "count",
      },
      ExpressionAttributeValues: {
        ":zero": 0,
        ":incr": 1,
      },
    })
  );

  const data = await ddbDocClient.send(
    new GetCommand({
      TableName,
      Key: { name },
    })
  );

  console.log("Got data", data);

  return {
    statusCode: 200,
    headers: {
      "content-type": "application/json",
    },
    body: JSON.stringify({
      message: `hello ${event.pathParameters?.name ?? "world"}!`,
      queryStringParameters: event.queryStringParameters,
      pathParameters: event.pathParameters,
      Item: data?.Item,
      tables: {
        visitors: TableName,
      },
    }),
  };
};
