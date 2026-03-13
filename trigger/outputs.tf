output "id" {
  description = "Glue trigger Name"
  value       = aws_glue_trigger.this[0].id
}

output "arn" {
  description = "Glue trigger ARN"
  value       = aws_glue_trigger.this[0].arn
}
