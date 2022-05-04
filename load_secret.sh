#!/bin/bash

export AWS_ACCESS_KEY_ID=$(cat .secret/credential.json | jq -r ".AWS_KEY")
export AWS_SECRET_ACCESS_KEY=$(cat .secret/credential.json | jq -r ".AWS_SECRET_KEY")

export S3_BUCKET=$(cat .secret/credential.json | jq -r ".S3_BUCKET")
export AWS_DEFAULT_REGION=$(cat .secret/credential.json | jq -r ".S3_REGION")
#Verify
#aws s3 ls s3://${S3_BUCKET} 
mkdir -p build
cp kube/secret.yaml build/secret.yaml
conf_file=build/secret.yaml
AWS_DEFAULT_REGION_BASE64=$(echo -n ${AWS_DEFAULT_REGION}| base64)
S3_BUCKET_BASE64=$(echo -n ${S3_BUCKET}| base64)
AWS_ACCESS_KEY_ID_BASE64=$(echo -n ${AWS_ACCESS_KEY_ID}| base64)
AWS_SECRET_ACCESS_KEY_BASE64=$(echo -n ${AWS_SECRET_ACCESS_KEY}| base64)


gsed -i 's|${S3_REGION}|'${AWS_DEFAULT_REGION_BASE64}'|g' $conf_file
gsed -i 's|${S3_BUCKET}|'${S3_BUCKET_BASE64}'|g' $conf_file
gsed -i 's|${AWS_KEY}|'${AWS_ACCESS_KEY_ID_BASE64}'|g' $conf_file
gsed -i 's|${AWS_SECRET_KEY}|'${AWS_SECRET_ACCESS_KEY_BASE64}'|g' $conf_file

kubectl apply -f $conf_file
