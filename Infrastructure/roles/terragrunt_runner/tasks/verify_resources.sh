#!/bin/bash

# Owner: Jino Rigney
# Contact: jino.rigney@disraptor.co.za

# The purpose of this script is to validate the deployment of the resources created by the terragrunt_runner role. 
# This script is called by the ansible script (terragrunt_runner.yml) and is passed the module_dependency variable.

# ==============================================================================================================================================

module_resource=$(basename "$1")

DEFAULT_REGION="af-south-1"

if [ -z "$module_resource" ]; then
    echo "No module_dependency variable passed in. Exiting script."
    exit 1
fi

echo -e "[ Beginning Verification of Resources ] \n"

# Check current resource being provisioned based on the variable passed in from ansible script.
IS_S3=$(echo "$module_resource" | grep -qi "S3" && echo true || echo false 2>/dev/null)
IS_GLUE=$(echo "$module_resource" | grep -qi "Glue" && echo true || echo false 2>/dev/null)
IS_SNS=$(echo "$module_resource" | grep -qi "SNS" && echo true || echo false 2>/dev/null)
IS_KDS=$(echo "$module_resource" | grep -qi "KDS" && echo true || echo false 2>/dev/null)
IS_KDF=$(echo "$module_resource" | grep -qi "KDF" && echo true || echo false 2>/dev/null)
IS_REDSHIFT=$(echo "$module_resource" | grep -qi "Redshift" && echo true || echo false 2>/dev/null)
IS_CLOUDWATCH=$(echo "$module_resource" | grep -q -i "Cloudwatch" && echo true || echo false 2>/dev/null)
IS_MSK=$(echo "$module_resource" | grep -qi "MSK" && echo true || echo false 2>/dev/null)


# ==============================================================================================================================================

# Verify S3 bucket existence. This will only run if the module_dependency variable contains the string "s3".
# If not, it means the value of IS_S3 is empty and the check will not run.

if [[ "$IS_S3" == "true"  ]]; then
    cd $1
    pwd

    S3_BUCKET_ID=$(terragrunt output s3_bucket_id | tr -d '"')

    aws s3api head-bucket --bucket "$S3_BUCKET_ID" --region "$DEFAULT_REGION"
    exit_code=$?

    if [ $exit_code -eq 0 ]; then
        echo "S3 bucket deployment verified. The S3 bucket $S3_BUCKET_ID exists."
        exit 0
    else
        echo "S3 bucket deployment verification failed. The S3 bucket does not exist."
        exit 1 # Fail the script
    fi
fi

#verify glue catalog db
if [ "$IS_GLUE" ]; then
    cd $1

    GLUE_CATALOG_DB_NAME=$(terragrunt output glue_catalog_db_name | tr -d '"')
    GLUE_CATALOG_TABLE_NAME=$(terragrunt output glue_catalog_table_name | tr -d '"')
    GLUE_CRAWLER_NAME=$(terragrunt output glue_crawler_name | tr -d '"')
    GLUE_CONNECTION_NAME=$(terragrunt output glue_connection_name 2>/dev/null | tr -d '"')
    GLUE_DEV_ENDPOINT_NAME=$(terragrunt output glue_dev_endpoint_name 2>/dev/null | tr -d '"')

    if aws glue get-database --name "$GLUE_CATALOG_DB_NAME" --region "$DEFAULT_REGION"; then
        echo "Glue Catalog DB deployment verified."
    else 
        echo "Glue Catalog DB deployment verification failed"
        exit 1 # Fail the script
    fi    

    #verify glue table 
    if aws glue get-table --name "$GLUE_CATALOG_TABLE_NAME" --database-name "$GLUE_CATALOG_DB_NAME" --region "$DEFAULT_REGION"; then
        echo "Glue Catalog table deployment verified."
    else
        echo "Glue catalog table deployment failed"
        exit 1 # Fail the script 
    fi

    #verify glue crawler 

    if aws glue get-crawler --name "$GLUE_CRAWLER_NAME" --region "$DEFAULT_REGION"; then
        echo "Glue Crawler deployment verified."
    else
        echo "Glue Crawler deployment failed"
        exit 1 # Fail the script 
    fi

    #verify glue connection 

    if [ ! -z "$GLUE_CONNECTION_NAME" ]; then 
        if aws glue get-connection --name "$GLUE_CONNECTION_NAME" --region "$DEFAULT_REGION"; then 
            echo "Glue connection deployment verified."
        else 
            echo "Glue connection deployment failed"
            exit 1 # Fail the script 
        fi
    else 
        echo "Glue connection not needed"          
    fi

    #glue dev endpoint verification 

    if [ ! -z "$GLUE_DEV_ENDPOINT_NAME" ]; then 
        if aws glue get-dev-endpoint --enpoint-name "$GLUE_DEV_ENDPOINT_NAME" --region "$DEFAULT_REGION"; then 
            echo "glue dev endpoint deployment verified"
        else 
            echo "glue dev endpoint deployment failed"
            exit 1 # Fail the script 
        fi 
    else 
        echo "Glue Dev Enpoint not needed"
    fi

    exit 0
fi

# verify kinesis delivery stream
if [ "$IS_KDF" ]; then 
    cd $1

    EXTENDED_S3_STREAM_NAME=$(terragrunt output extended_s3_stream_name | tr -d '"') #need to check 
    REDSHIFT_STREAM_NAME=$(terragrunt output redshift_stream_arn | tr -d '"')

    if aws kinesis describe-delivery-stream --delivery-stream-name "$EXTENDED_S3_STREAM_NAME" --region "$DEFAULT_REGION"; then 
        echo "Kinesis delivery stream deployment verified"
    else 
        echo "Kinesis delivery stream deployment failed"
        exit 1 # Fail the script 
    fi

    if aws kinesis describe-delivery-stream --delivery-stream-name "$REDSHIFT_STREAM_NAME" --region "$DEFAULT_REGION"; then 
        echo "Kinesis delivery stream deployment verified"
    else 
        echo "Kinesis delivery stream deployment failed"
        exit 1 # Fail the script 
    fi
 
    exit 0

fi


# verify kinesis stream consumer 

if [ "$IS_KDS" ]; then 
    cd $1

    STREAM_ARN=$(terragrunt output stream_arn | tr -d '"') #need to check 
    STREAM_CONSUMER_ARN=$(terragrunt output stream_consumer_arn | tr -d '"')

    if aws kinesis describe-stream --stream-arn "$STREAM_ARN" --region "$DEFAULT_REGION"; then 
        echo "Kinesis Stream deployment verified"
    else 
        echo "Kinesis Stream deployment failed"
        exit 1 #Fail the script 
    fi

    if aws kinesis describe-stream-consumer --stream-arn "$STREAM_CONSUMER_ARN" --region "$DEFAULT_REGION"; then 
        echo "Stream Consumer deployment verified"
    else 
        echo "Stream Consumer deployment failed"
        exit 1 #Fail the script 
    fi

    exit 0
fi
    

# verify sns topic 

if [ "$IS_SNS" ]; then 
    cd $1

    SNS_TOPIC_ARN=$(terragrunt output sns_topic_arn | tr -d '"')
    SNS_FIREHOSE_SUBSCRIPTION_ARN=$(terragrunt output sns_firehose_subscription_arn | tr -d '"')
    SNS_APPLICATION_SUBSCRIPTION_ARN=$(terragrunt output sns_application_subscription_arn | tr -d '"') #need to check 
    SNS_EMAIL_SUBSCRIPTION_ARN=$(terragrunt output sns_email_subscription_arn | tr -d '"') #need to check 
    SNS_LAMBDA_SUBSCRIPTION_ARN=$(terragrunt output sns_lambda_subscription_arn | tr -d '"')

    if aws sns get-topic-attributes --topic-arn "$SNS_TOPIC_ARN"; then 
        echo "SNS topic deployment verified"
    else 
        echo "SNS topic deployment failed"
        exit 1 # Fail the script 
    fi

    # verify sns firehose subscription 
    if [ ! -z "$SNS_FIREHOSE_SUBSCRIPTION_ARN" ]; then 
        if aws sns get-endpoint-attributes --endpoint-arn "$SNS_FIREHOSE_SUBSCRIPTION_ARN" --region "$DEFAULT_REGION"; then 
            echo "Sns firehose subscription deployment verified"
        else 
            echo "SNS Firehose subscription deployment failed"
            exit 1 # Fail the script 
        fi
    else 
        echo "SNS Firehose subscription not needed"
    fi

    # verify sns email subscription
    if [ ! -z "$SNS_EMAIL_SUBSCRIPTION_ARN" ]; then 
        if aws sns get-endpoint-attributes --endpoint-arn "$SNS_EMAIL_SUBSCRIPTION_ARN" --region "$DEFAULT_REGION"; then 
            echo "SNS Email Subscription deployment verified"
        else 
            echo "SNS Email Subscription deployment failed"
            exit 1 # Fail the script 
        fi
    else 
        echo "SNS Email Subscription not needed"
    fi

    # verify sns lambda subscription
    if [ ! -z "$SNS_LAMBDA_SUBSCRIPTION_ARN" ]; then 
        if aws sns get-endpoint-attributes --endpoint-arn "$SNS_LAMBDA_SUBSCRIPTION_ARN" --region "$DEFAULT_REGION"; then 
            echo "SNS Lambda Subscription deployment verified"
        else 
            echo "SNS Lambda Subscription deployment failed"
            exit 1 # Fail the script 
        fi
    else 
        echo "SNS Lambda Subscription not needed"
    fi      

    # verify sns application subscription
    if [ ! -z "$SNS_APPLICATION_SUBSCRIPTION_ARN" ]; then
        if aws sns get-endpoint-attributes --endpoint-arn "$SNS_APPLICATION_SUBSCRIPTION_ARN" --region "$DEFAULT_REGION"; then 
            echo "SNS Application Subscription deployment verified"
        else 
            echo "SNS Application Subscription deployment failed"
            exit 1 # Fail the script 
        fi
    else 
        echo "SNS Application Subscription not needed"
    fi

    exit 0
    
fi

# verify lambda function
if [ "$IS_LAMBDA" ]; then
    cd $1

    LAMBDA_FUNCTION_ARN=$(terragrunt output lambda_function_arn | tr -d '"')
    LAMBDA_FUNCTION_ALIAS_NAME=$(terragrunt output lambda_alias_name | tr -d '"')

    if aws lambda get-function --function-name "$LAMBDA_FUNCTION_ARN" --region "$DEFAULT_REGION"; then 
        echo "Lambda function deployment verified"
    else 
        echo "Lambda function deployment failed"
        exit 1 # Fail the script 
    fi

    if aws lambda get-alias --function-name "$LAMBDA_FUNCTION_ALIAS_NAME" --name "$LAMBDA_function_alias_name" --region "$DEFAULT_REGION"; then 
        echo "Lambda alias deployment verified"
    else 
        echo "Lambda alias deployment failed"
        exit 1 # Fail the script 
    fi

    exit 0
fi  
            

# verify redshift cluster
if [ "$IS_REDSHIFT" ]; then
    cd $1

    REDSHIFT_CLUSTER_ARN=$(terragrunt output redshift_cluster_arn | tr -d '"')
    
    if aws redshift describe-clusters --cluster-identifier "$REDSHIFT_CLUSTER_ARN" --region "$DEFAULT_REGION"; then 
        echo "Redshift cluster deployment verified"
    else 
        echo "Redshift cluster deployment failed"
        exit 1 # Fail the script 
    fi

    exit 0

fi

if [ "$IS_MSK" ]; then
    cd $1

    MSK_CLUSTER_ARN=$(terragrunt output msk_cluster_arn | tr -d '"')

    if aws kafka describe-cluster --cluster-arn "$MSK_CLUSTER_ARN" --region "$DEFAULT_REGION"; then 
        echo "MSK cluster deployment verified"
    else 
        echo "MSK cluster deployment failed"
        exit 1 # Fail the script 
    fi

fi    

echo -e "[ No resources to verify ] \n "
exit 0
# Add more verification checks for other resources as needed

