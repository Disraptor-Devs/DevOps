output "glue_catalog_db_arn" {
  description = "Output the arn of the Catalog DB"
  value       = aws_glue_catalog_database.catalog_db.arn
}

output "glue_catalog_db_name" {
  description = "Output the name of the Catalog DB"
  value       = aws_glue_catalog_database.catalog_db.name
}

output "glue_catalog_db_id" {
  description = "Output the id of the Catalog DB"
  value       = aws_glue_catalog_database.catalog_db.id
}
output "glue_catalog_db_catalogId" {
  description = "Output the catalog id of the Catalog DB"
  value       = aws_glue_catalog_database.catalog_db.catalog_id
}

output "glue_catalog_table_arn" {
  description = "Output the arn of the Catalog Table"
  value       = aws_glue_catalog_table.catalog_table.arn
}

output "glue_catalog_table_name" {
  description = "Output the name of the Catalog Table"
  value       = aws_glue_catalog_table.catalog_table.name
}

output "glue_crawler_arn" {
  description = "Output the arn for the Glue Crawler"
  value       = aws_glue_crawler.glue_crawler.arn
}

output "glue_crawler_name" {
  description = "Output the name for the Glue Crawler"
  value       = aws_glue_crawler.glue_crawler.name
}

output "glue_crawler_id" {
  description = "Output the arn for the Glue Crawler"
  value       = aws_glue_crawler.glue_crawler.id
}

output "glue_crawler_schedule" {
  description = "Output the schedule for the Glue Crawler"
  value       = aws_glue_crawler.glue_crawler.schedule
}

output "glue_connection_arn" {
  description = "Output the name of the Glue Connection"
  value       = var.is_glue_connection ? aws_glue_connection.glue_connect[0].arn : null
}

output "glue_connection_name" {
  description = "Output the name of the Glue Connection"
  value       = var.is_glue_connection ? aws_glue_connection.glue_connect[0].name : null
}

output "glue_dev_endpoint_arn" {
  description = "Specify the arn for the Glue dev endpoint"
  value       = var.is_glue_dev_endpoint ? aws_glue_dev_endpoint.dev_endpoint[0].arn : null
}

output "glue_dev_endpoint_private_address" {
  description = "Specify the arn for the Glue dev endpoint"
  value       = var.is_glue_dev_endpoint ? aws_glue_dev_endpoint.dev_endpoint[0].private_address : null
}