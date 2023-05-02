#!/bin/bash

cd ecr && terraform init && terraform apply -auto-approve && cd ..

docker build -t $(cat ecr/ecr.txt) .
docker push $(cat ecr/ecr.txt)

terraform init
terraform apply -auto-approve
