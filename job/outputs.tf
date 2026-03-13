output "id" {
  description = "Glue Job Name"
  value       = aws_glue_job.this[0].id
}

output "arn" {
  description = "Glue Job ARN"
  value       = aws_glue_job.this[0].arn
}
