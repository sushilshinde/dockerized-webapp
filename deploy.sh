configure_aws_cli() {
	aws --version
	aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID
	aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY
	aws configure set default.region us-east-1
	aws configure set default.output json
	echo "Configured AWS CLI."
}


push_ecr_image() {
	echo "Pushing Docker Image...."
	eval $(aws ecr get-login --region $AWS_REGION --no-include-email)
	docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$AWS_REPOSITORY:$TAG
	echo "Docker Image published."

}