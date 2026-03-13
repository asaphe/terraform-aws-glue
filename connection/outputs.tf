output "id" {
  description = "Glue Connection Name"
  value       = aws_glue_connection.this[0].id
}
