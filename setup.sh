#!/bin/sh

hal config stats disable

# Version

hal config version edit --version $SPINNAKER_VERSION

# Provider

hal config provider kubernetes enable

hal config provider kubernetes account add $KUBE_ACCOUNT \
    --provider-version v2 \
    --context $KUBE_CONTEXT

# Artifacts

hal config features edit --artifacts true

hal config artifact helm account add stable --repository https://kubernetes-charts.storage.googleapis.com

# Env

# If you need to use a different kubernetes cluster to test deployment you will have to specify another provider
# for a k8s account

hal config deploy edit --type distributed --account-name $KUBE_ACCOUNT

# Storage

echo $MINIO_SECRET_KEY | hal config storage s3 edit \
    --endpoint $MINIO_ENDPOINT \
    --path-style-access true \
    --access-key-id $MINIO_ACCESS_KEY \
    --secret-access-key

hal config storage edit --type s3

# Deploy

hal deploy apply