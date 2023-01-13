yarn_install:
	(cd lambda && yarn)

bundle_lambda: yarn_install
	(cd lambda && yarn bundle)

deploy: bundle_lambda
	terraform apply