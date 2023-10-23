output "zookeeper_connect_string" {
  description = "Zookeeper connection string"
  value       = aws_msk_cluster.this.zookeeper_connect_string
}

output "bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = aws_msk_cluster.this.bootstrap_brokers_tls
}

output "msk_cluster_arn" {
  description = "The arn for the MSK cluster"
  value       = aws_msk_cluster.this.arn
}

output "msk_cluster_name" {
  description = "The name of the MSK cluster"
  value       = aws_msk_cluster.this.name
}
