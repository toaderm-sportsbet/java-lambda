BUCKET_NAME=cst-dev-sg-cd-s3/cbse-test
BUCKET=cst-dev-sg-cd-s3
KEY_PATH=cbse-test/lambda-0.0.1-SNAPSHOT.jar
FUNCTION_NAME=lambda-0.0.1-SNAPSHOT
REGION=ap-southeast-2
PROFILE=default
CFN_TEMPLATE=./aws/template.yaml
STACK_NAME=java-lambda-function

build:
	@mvn clean package

deploy: build
	@aws s3 cp target/$(FUNCTION_NAME).jar s3://$(BUCKET_NAME)/$(FUNCTION_NAME).jar --region $(REGION) --profile $(PROFILE)

deploy-stack: deploy
	@aws cloudformation deploy --template-file $(CFN_TEMPLATE) --stack-name $(STACK_NAME) --parameter-overrides LambdaCodeS3Bucket=$(BUCKET) LambdaCodeS3Key=$(KEY_PATH) --region $(REGION) --profile $(PROFILE) --capabilities CAPABILITY_IAM

.PHONY: build deploy
