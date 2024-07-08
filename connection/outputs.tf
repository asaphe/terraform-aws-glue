output "id" {
  description = "Glue Connection Name"
  value       = element(concat(aws_glue_connection.this.*.id, [""]), 0)
}
