
import boto3
import logging
import os
 
 
cluster = os.environ.get("ECS_CLUSTER")
service = os.environ.get("ECS_TASK_DEFINITION")
 
 
logger = logging.getLogger()
logger.setLevel(logging.INFO)
 
 
client = boto3.client('ecs')
 
 
def lambda_handler(event, context):
    logger.info("Updating the services in {0} cluster".format(cluster))
    client.update_service(cluster=cluster, service=service, forceNewDeployment=True)
 
 
    return {
        "statusCode": 200,
        "body": "ECS service successfully updated"
    }