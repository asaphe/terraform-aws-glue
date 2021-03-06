resource "aws_glue_job" "this" {
  name     = var.name == null ? local.name : var.name
  role_arn = var.role_arn

  description               = "PROVISIONED BY TERRAFORM${length(var.description) > 0 ? " - ${var.description}" : ""}"
  connections               = var.connections
  glue_version              = var.glue_version
  max_capacity              = contains(keys(var.command), "name") && lookup(var.command, "name", null) == "pythonshell" ? var.max_capacity : null
  max_retries               = var.max_retries
  timeout                   = var.timeout
  security_configuration    = var.security_configuration
  worker_type               = var.worker_type
  number_of_workers         = var.number_of_workers
  default_arguments         = var.default_arguments
  non_overridable_arguments = var.non_overridable_arguments

  command {
    name            = contains(keys(var.command), "name") ? lookup(var.command, "name", null) : null
    script_location = contains(keys(var.command), "script_location") ? lookup(var.command, "script_location") : null
    python_version  = contains(keys(var.command), "name") && lookup(var.command, "name", null) == "pythonshell" ? lookup(var.command, "python_version", null) : null
  }

  execution_property {
    max_concurrent_runs = lookup(var.execution_property, "max_concurrent_runs", 1)
  }

  dynamic "notification_property" {
    iterator = notification_property
    for_each = var.notification_property

    content {
      notify_delay_after = notification_property.value
    }
  }

  tags = merge(
    {
      "Name" = local.name
    },
    var.tags,
  )

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }
}