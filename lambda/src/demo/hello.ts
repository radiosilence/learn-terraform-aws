import { APIGatewayProxyHandler } from "aws-lambda";

export const handler: APIGatewayProxyHandler = async (event, context) => {
  const debug = { event, context, env: process.env };
  console.log("i have run", debug);
  return {
    statusCode: 200,
    headers: {
      "content-type": "application/json",
    },
    body: JSON.stringify({
      message: "hello world",
      debug,
    }),
  };
};
