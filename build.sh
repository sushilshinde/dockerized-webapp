#!/bin/bash
set -eo pipefail
TAG=dockerized-webapp:$CIRCLE_SHA1
DEPLOYMENT_TYPE=$1
docker build -t $TAG .