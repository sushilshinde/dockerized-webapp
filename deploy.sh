#!/bin/bash
set -eo pipefail

# more bash-friendly output for jq
JQ="jq --raw-output --exit-status"

ENV=$1
TAG=$2

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
	eval $(aws ecr get-login --region us-east-1 --no-include-email)	
	docker push 811668436784.dkr.ecr.us-east-1.amazonaws.com/dockerized-webapp:$TAG
	echo "Docker Image published."
}

configure_aws_cli
push_ecr_image