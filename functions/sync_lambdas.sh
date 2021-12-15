#!/bin/bash
echo
echo "Packging the files"
echo "======== === ====="
cd functions/source
zip -r ../../ct_batchcreation_lambda.zip new_account_handler.py cfnresource.py 
zip -r ../../ct_account_create_lambda.zip account_create.py cfnresource.py
echo
region="us-east-1"
echo "Copying to $region"
echo "======= == ========="
aws s3 cp ../../ct_account_create_lambda.zip s3://eng-enablement/
aws s3 cp ../../ct_batchcreation_lambda.zip s3://eng-enablement/
aws s3 cp ../../BatchAccountCreation.yaml s3://eng-enablement/BatchAccountCreation.yaml
echo
