export function handler(blah?: number) {
  console.log("i have run", blah, process.env.MY_TABLE_NAME);
  return "hi";
}
