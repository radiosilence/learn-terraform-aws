lambda_yarn:
	(cd lambda && yarn)

lambda_bundle: lambda_yarn
	(cd lambda && yarn bundle)

init:
	terraform init -upgrade

validate: 
	terraform validate

apply: init
	terraform apply -auto-approve

deploy: lambda_bundle apply
	
destroy:
	terraform destroy

invoke: deploy
	aws lambda invoke --region=us-west-2 --function-name=$(terraform output -raw function_name) response.json && cat response.json | jq