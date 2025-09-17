#!/bin/bash

set -eu

if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
fi

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

REPO="${ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/hands-on-app"

aws ecr get-login-password | docker login --username AWS --password-stdin "${REPO}"

docker build -t "${REPO}:latest" ./app
docker push "${REPO}:latest"
