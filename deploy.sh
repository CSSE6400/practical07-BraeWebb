#!/bin/bash

cd ecr && terraform init && terraform apply -auto-approve && cd ..

url=$(cat ecr/ecr.txt)

cat ecr/creds.txt | docker login --username AWS --password-stdin $(cat ecr/endpoint.txt)

docker build -t $url .
docker push $url

terraform init
terraform apply -auto-approve
