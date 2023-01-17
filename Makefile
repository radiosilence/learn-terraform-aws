lambda_yarn:
	(cd lambda && yarn)

lambda_bundle: lambda_yarn
	(cd lambda && yarn bundle)

lambdago_bundle:
	(cd lambdago/handlers/demo && GOOS=linux GOARCH=amd64 go build -o ./build/main main.go && chmod +x ./build/main && zip -jX ./build/package.zip ./build/main)

init:
	terraform init -upgrade

validate: 
	terraform validate

apply: init
	terraform apply -auto-approve

deploy:  lambdago_bundle apply
	
destroy:
	terraform destroy

invoke: deploy
	aws lambda invoke --region=us-west-2 --function-name=$(terraform output -raw function_name) response.json && cat response.json | jq