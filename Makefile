yarn_install:
	(cd lambda && yarn)

bundle_lambda: yarn_install
	(cd lambda && yarn bundle)

init:
	terraform init

apply: init
	terraform apply -auto-approve

deploy: bundle_lambda apply
	
destroy:
	terraform destroy

invoke: deploy
	aws lambda invoke --region=us-west-2 --function-name=$(terraform output -raw function_name) response.json && cat response.json | jq