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
}

variable "data_lake_principal_identifier" {
  description = "Specify the Data Lake principal identifier"
  type        = string
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