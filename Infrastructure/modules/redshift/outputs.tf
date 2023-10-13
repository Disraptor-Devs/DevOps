output "redshift_database" {
  description = "The database for the Redshift cluster"
  value       = aws_redshift_cluster.redshift.database_name
  sensitive   = true
}

output "redshift_master_username" {
  description = "The master username for the Redshift cluster"
  value       = aws_redshift_cluster.redshift.master_username
  sensitive   = true
}

output "redshift_master_password" {
  description = "The master password for the Redshift cluster"
  value       = aws_redshift_cluster.redshift.master_password
  sensitive   = true
}


