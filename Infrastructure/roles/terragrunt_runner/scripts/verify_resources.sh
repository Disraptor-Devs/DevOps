#!/bin/bash

# S3 bucket arn
S3_BUCKET_ARN=$(terragrunt output s3_bucket_arn)

# kdf arn's 
Glue_Catalog_DB_ARN=$(terragrunt output glue_catalog_db_arn)
Glue_Catalog_Table_ARN=$(terragrunt output glue_catalog_table_arn)
Glue_Crawler_ARN=$(terragrunt output glue_crawler_arn)
Glue_Connection_ARN=$(terragrunt output glue_connection_arn)
Glue_Dev_Endpoint_ARN=$(terragrunt output glue_dev_endpoint_arn)
Extended_S3_Stream_ARN=$(terragrunt output extended_s3_stream_arn) #need to check 
Redshift_Stream_ARN=$(terragrunt output redshift_stream_arn)
Created_S3_Bucket_ARN=$(terragrunt output created_s3_bucket_arn) #need to check 
Kinesis_Delivery_Stream_ARN=$(terragrunt output kinesis_delivery_stream_arn)

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

# Verify S3 bucket existence
if aws s3 ls "s3://$S3_BUCKET_ARN" 2>/dev/null; then
    echo "S3 bucket deployment verified. The S3 bucket $S3_BUCKET_ARN exists."
else
    echo "S3 bucket deployment verification failed. The S3 bucket $S3_BUCKET_ARN does not exist."
    exit 1 # Fail the script
fi

#verify glue catalog db
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

if aws glue get-connection --name "$Glue_Connection_ARN">/dev/null; then 
    echo "Glue connection deployment verified."

else 
    echo "Glue connection deployment failed"
    exit 1 # Fail the script 

fi  

#glue dev endpoint verification 

if aws glue get-dev-endpoint --enpoint-name "$Glue_Dev_Endpoint_ARN">/dev/null; then 
    echo "glue dev endpoint deployment verified"

else 
   echo "glue dev endpoint deployment failed"
   exit 1 # Fail the script 

fi      

#verify kinesis delivery stream

if aws kinesis describe-delivery-stream --delivery-stream-name "$Kinesis_Delivery_Stream_ARN">/dev/null; then
    echo "Kinesis delivery stream deployment verified"

else 
    echo "Kinesis delivery stream deployment failed"
    exit 1 # Fail the script 

fi 

#verify kinesis stream consumer 

if aws kinesis describe-stream-consumer --stream-arn "$stream_consumer_arn">/dev/null; then 
     echo "Stream Consumer deployment verified"

else 
     echo "Stream Consumer deployment failed"
     exit 1 #Fail the script      

#verify sns topic 

if aws sns get-topic-attributes --topic-arn "$SNS_Topic_ARN">/dev/null; then 
    echo "SNS topic deployment verified"

else 
    echo "SNS topic deployment failed"
    exit 1 # Fail the script 

fi

#verify sns firehose subscription 
if aws firehose describe-delivery-stream --delivery-stream-name "$SNS_Firehose_Subscription_ARN">/dev/null; then 
    echo "Sns firehose subscription deployment verified"

else 
    echo "SNS Firehose subscription deployment failed"
    exit 1 # Fail the script 

fi         

#verify sns lambda subscription 
if aws lambda get-function --function-name "$SNS_Lambda_Subscription_ARN">/dev/null; then
    echo "SNS Lambda Subscription deployment verified"

else 
    echo "SNS Lambda Subscription deployment failed"
    exit 1 #fail the script 

fi        






# Add more verification checks for other resources as needed
