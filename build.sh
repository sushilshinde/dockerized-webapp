#!/bin/bash
set -eo pipefail

TAG=811668436784.dkr.ecr.us-east-1.amazonaws.com/dockerized-webapp:$CIRCLE_SHA1

docker build -t $TAG .