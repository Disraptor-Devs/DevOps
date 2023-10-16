#!/bin/bash

# Owner: Jino Rigney
# Contact: jino.rigney@disraptor.co.za

# The purpose of this script is to validate the deployment of the resources created by the terragrunt_runner role. 
# This script is called by the ansible script (terragrunt_runner.yml) and is passed the module_dependency variable.

# ==============================================================================================================================================

# Check current resource being provisioned based on the variable passed in from ansible script.
IS_S3 = $(grep -i "s3" $1)
IS_GLUE = $(grep -i "glue" $1)
IS_SNS = $(grep -i "sns" $1)
IS_KDS = $(grep -i "kds" $1)
IS_LAMBDA = $(grep -i "lambda" $1)
IS_REDSHIFT = $(grep -i "redshift" $1)
IS_CLOUDWATCH = $(grep -i "cloudwatch" $1)
IS_MSK = $(grep -i "msk" $1)


# ==============================================================================================================================================

# S3 bucket arn
S3_BUCKET_PATH=$(terragrunt output s3_bucket_path)

# kdf arn's 
Extended_S3_Stream_ARN=$(terragrunt output extended_s3_stream_arn) #need to check 
Redshift_Stream_ARN=$(terragrunt output redshift_stream_arn)

#glue arns
Glue_Catalog_DB_ARN=$(terragrunt output glue_catalog_db_arn)
Glue_Catalog_Table_ARN=$(terragrunt output glue_catalog_table_arn)
Glue_Crawler_ARN=$(terragrunt output glue_crawler_arn)
Glue_Connection_ARN=$(terragrunt output glue_connection_arn)
Glue_Dev_Endpoint_ARN=$(terragrunt output glue_dev_endpoint_arn)

#kds arns
stream_arn=$(terragrunt output stream_arn) #need to check 
stream_kms_key_arn=$(terragrunt output stream_kms_key_arn) #need to check  
stream_consumer_arn=$(terragrunt output stream_consumer_arn)

#sns arns
SNS_Topic_ARN=$(terragrunt output sns_topic_arn)
SNS_Firehose_Subscription_ARN=$(terragrunt output sns_firehose_subscription_arn)
SNS_Application_Subscription_ARN=$(terragrunt output sns_application_subscription_arn) #need to check 
SNS_Email_Subscription_ARN=$(terragrunt output sns_email_subscription_arn) #need to check 
SNS_Lambda_Subscription_ARN=$(terragrunt output sns_lambda_subscription_arn)

#lambda arns
LAMBDA_function_arn=$(terragrunt output lambda_function_arn)
LAMBDA_function_alias_name=$(terragrunt output lambda_alias_name)

#msk arns
MSK_cluster_arn=$(terragrunt output msk_cluster_arn)

#redshift arns
Redshift_Cluster_ARN=$(terragrunt output redshift_cluster_arn)
# ==============================================================================================================================================

# Verify S3 bucket existence. This will only run if the module_dependency variable contains the string "s3".
# If not, it means the value of IS_S3 is empty and the check will not run.

if [ ! -z "$IS_S3" ]; then
    if aws s3 ls "$S3_BUCKET_PATH" 2>/dev/null; then
        echo "S3 bucket deployment verified. The S3 bucket $S3_BUCKET_PATH exists."
        exit 0
    else
        echo "S3 bucket deployment verification failed. The S3 bucket $S3_BUCKET_ARN does not exist."
        exit 1 # Fail the script
    fi
fi

#verify glue catalog db
if [ ! -z "$IS_GLUE" ]; then
    if aws glue get-database --name "$Glue_Catalog_DB_ARN">/dev/null; then
        echo "Glue Catalog DB deployment verified."
    else 
        echo "Glue Catalog DB deployment verification failed"
        exit 1 # Fail the script
    fi    

    #verify glue table 
    if aws glue get-table --name "$Glue_Catalog_Table_ARN">/dev/null; then
        echo "Glue catalog table deployment verified."
    else
        echo "Glue catalog table deployment failed"
        exit 1 # Fail the script 
    fi

    #verify glue crawler 

    if aws get-crawler --name "$Glue_Crawler_ARN">/dev/null; then
        echo "Glue crawler deployment verified."
    else
        echo "Glue crawler deployment failed"
        exit 1 # Fail the script 
    fi

    #verify glue connection 

    if [ ! -z "$Glue_Connection_ARN" ]; then 
        if aws glue get-connection --name "$Glue_Connection_ARN">/dev/null; then 
            echo "Glue connection deployment verified."
        else 
            echo "Glue connection deployment failed"
            exit 1 # Fail the script 
        fi
    else 
        echo "Glue connection not needed"          
    fi

    #glue dev endpoint verification 

    if [ ! -z "$Glue_Dev_Endpoint_ARN "]; then 
        if aws glue get-dev-endpoint --enpoint-name "$Glue_Dev_Endpoint_ARN">/dev/null; then 
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
if [ ! -z "$IS_KDF" ]; then 
    if aws kinesis describe-delivery-stream --delivery-stream-name "$Extended_S3_Stream_ARN">/dev/null; then 
        echo "Kinesis delivery stream deployment verified"
    else 
        echo "Kinesis delivery stream deployment failed"
        exit 1 # Fail the script 
    fi

    if aws kinesis describe-delivery-stream --delivery-stream-name "$Redshift_Stream_ARN">/dev/null; then 
        echo "Kinesis delivery stream deployment verified"
    else 
        echo "Kinesis delivery stream deployment failed"
        exit 1 # Fail the script 
    fi

    exit 0

fi


# verify kinesis stream consumer 

if [ ! -z "$IS_KDS" ]; then 

    if aws kinesis describe-stream --stream-arn "$stream_arn">/dev/null; then 
        echo "Kinesis Stream deployment verified"
    else 
        echo "Kinesis Stream deployment failed"
        exit 1 #Fail the script 
    fi

    if aws kinesis describe-stream-consumer --stream-arn "$stream_consumer_arn">/dev/null; then 
        echo "Stream Consumer deployment verified"
    else 
        echo "Stream Consumer deployment failed"
        exit 1 #Fail the script 
    fi

    exit 0
fi
    

# verify sns topic 

if [ ! -z "$IS_SNS" ] then; 
    if aws sns get-topic-attributes --topic-arn "$SNS_Topic_ARN">/dev/null; then 
        echo "SNS topic deployment verified"
    else 
        echo "SNS topic deployment failed"
        exit 1 # Fail the script 
    fi

    # verify sns firehose subscription 
    if [ ! -z "$SNS_Firehose_Subscription_ARN" ]; then 
        if aws sns get-endpoint-attributes --endpoint-arn "$SNS_Firehose_Subscription_ARN">/dev/null; then 
            echo "Sns firehose subscription deployment verified"
        else 
            echo "SNS Firehose subscription deployment failed"
            exit 1 # Fail the script 
        fi
    else 
        echo "SNS Firehose subscription not needed"
    fi

    # verify sns email subscription
    if [ ! -z "$SNS_Email_Subscription_ARN" ]; then 
        if aws sns get-endpoint-attributes --endpoint-arn "$SNS_Email_Subscription_ARN">/dev/null; then 
            echo "SNS Email Subscription deployment verified"
        else 
            echo "SNS Email Subscription deployment failed"
            exit 1 # Fail the script 
        fi
    else 
        echo "SNS Email Subscription not needed"
    fi

    # verify sns lambda subscription
    if [ ! -z "$SNS_Lambda_Subscription_ARN" ]; then 
        if aws sns get-endpoint-attributes --endpoint-arn "$SNS_Lambda_Subscription_ARN">/dev/null; then 
            echo "SNS Lambda Subscription deployment verified"
        else 
            echo "SNS Lambda Subscription deployment failed"
            exit 1 # Fail the script 
        fi
    else 
        echo "SNS Lambda Subscription not needed"
    fi      

    # verify sns application subscription
    if [ ! -z "$SNS_Application_Subscription_ARN" ]; then
        if aws sns get-endpoint-attributes --endpoint-arn "$SNS_Application_Subscription_ARN">/dev/null; then 
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
if [ ! -z "$IS_LAMBDA" ] then;
    if aws lambda get-function --function-name "$LAMBDA_function_arn">/dev/null; then 
        echo "Lambda function deployment verified"
    else 
        echo "Lambda function deployment failed"
        exit 1 # Fail the script 
    fi

    if aws lambda get-alias --function-name "$LAMBDA_function_arn" --name "$LAMBDA_function_alias_name">/dev/null; then 
        echo "Lambda alias deployment verified"
    else 
        echo "Lambda alias deployment failed"
        exit 1 # Fail the script 
    fi

    exit 0
fi  
            

# verify redshift cluster
if [ ! -z "$IS_REDSHIFT" ] then;
    if aws redshift describe-clusters --cluster-identifier "$Redshift_Cluster_ARN">/dev/null; then 
        echo "Redshift cluster deployment verified"
    else 
        echo "Redshift cluster deployment failed"
        exit 1 # Fail the script 
    fi

    exit 0

fi

# Add more verification checks for other resources as needed
