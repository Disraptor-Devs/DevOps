variable "cluster_identifier" {
  description = "The unique identifier of the Redshift cluster."
  type        = string
  default     = null
}

variable "database_name" {
  description = "The name of the default database to be created when the cluster is launched."
  type        = string
  default     = null
}

variable "port" {
  description = "The port number on which the Redshift cluster accepts connections."
  type        = number
  default     = 5439
}

variable "master_username" {
  description = "The database user name"
  type        = string
  default     = "admin"
}

variable "master_password" {
  description = "The database Password"
  type        = string
  default     = null
}

variable "node_type" {
  description = "The node type"
  type        = string
  default     = "dc2.large"
}

variable "cluster_type" {
  description = "The cluster type"
  type        = string
  default     = "single-node"
}

variable "number_of_nodes" {
  description = "The number of node"
  type        = number
  default     = 1
}

variable "automated_snapshot_retention_period" {
  description = "The number of days to wait before delete the snapshot"
  type        = number
  default     = 1
}

variable "publicly_accessible" {
  description = "Should the redshift  cluster be accessble outside the vpc"
  type        = bool
  default     = false
}

variable "vpc_security_group_ids" {
  description = "The vpc you want to assoiate the the cluster with"
  type        = list(string)
  default     = []
}

variable "cluster_subnet_group_name" {
  description = "The subnet groups you want to associate withe the Redshift cluster"
  type        = string
  default     = null
}

variable "iam_roles" {
  description = "The IAM roles to associate with this cluster"
  type        = list(string)
  default     = []
}

variable "snapshot_cluster_identifier" {
  description = "The snapshot name"
  type        = string
  default     = null
}

variable "tags" {
  description = "The tags name"
  type        = map(string)
  default     = null
}