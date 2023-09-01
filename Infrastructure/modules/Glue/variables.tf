variable "region" {
  description = "Specfies the region in which this resouce will be created in"
  type        = string
  default     = "af-south-1"
}

variable "is_existing_S3_bucket" {
  description = "Specifies whether we need to create an S3 or not"
  type        = bool
  default     = false
}

variable "glue_iam_role_name" {
  description = "Specify the name of the iam role created for Glue"
  type        = string
}

variable "glue_catalog_db_name" {
  description = "Specify the name of the Glue Catalog DB"
  type        = string
}

variable "create_table_default_permissions" {
  description = "Specify the default table permission"
  type        = string
  default     = "SELECT"
}

variable "data_lake_principal_identifier" {
  description = "Specify the Data Lake principal identifier"
  type        = string
  default     = "IAM_ALLOWED_PRINCIPALS"
}

variable "glue_crawler_name" {
  description = "Specify the name of the Glue Crawler"
  type        = string
}

variable "is_s3_target" {
  description = "Specifies whether the target of the crawler is an S3 target"
  type        = bool
  default     = false
}

variable "is_jdbc_target" {
  description = "Specifies whether the target of the crawler is an S3 target"
  type        = bool
  default     = false
}

variable "is_catalog_target" {
  description = "Specify if the target for the Glue Crawler is going to be a Glue catalog"
  type        = bool
  default     = false
}

variable "s3_bucket_id" {
  description = "Specifies the S3 bucket id if it's an existing S3 bucket"
  type        = string
  default     = ""
}


variable "glue_tags" {
  description = "Specify tags for Glue resources (Key,Value pairs)"
  type        = map(string)
}

variable "glue_connection_jdbc_connection_url" {
  description = "Specify the JDBC connection url for the Glue connection being created"
  type        = string
  default     = ""
}

variable "glue_connection_password" {
  description = "Specify the password for the glue connection"
  type        = string
  default     = ""
}

variable "glue_connection_username" {
  description = "Specify the username for the glue connection"
  type        = string
  default     = ""
}

variable "recrawl_behavior" {
  description = "Specify the recrawl behaviour for the glue crawler"
  type        = string
  default     = "CRAWL_EVERYTHING"

}

variable "crawler_cron_schedule" {
  description = "Specify the CRON schedule for the Glue crawler "
  type        = string
  default     = "cron(0 7 * * *)"
}

variable "is_glue_connection" {
  description = "Specify whether to create a glue connection"
  type        = bool
  default     = false
}

variable "physical_conn_availability_zone" {
  description = "Specify the physical connection requirements availability zone"
  type        = string
  default     = ""
}

variable "physical_conn_security_group_id" {
  description = "Specify the physical connection requirements security group ids"
  type        = string
  default     = ""
}

variable "physical_conn_subnet_id" {
  description = "Specify the physical connection requirements subnet id"
  type        = string
  default     = ""
}

variable "is_glue_dev_endpoint" {
  description = "Specify if we we should create a dev endpoint"
  type        = bool
  default     = false
}

variable "glue_table_name" {
  description = "Specify the name for the glue table being created"
  type        = string

}