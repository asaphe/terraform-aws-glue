output "id" {
  description = "Glue DB Name"
  value       = aws_glue_catalog_database.this[0].id
}

output "arn" {
  description = "Glue DB ARN"
  value       = aws_glue_catalog_database.this[0].arn
}
