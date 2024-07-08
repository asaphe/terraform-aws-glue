# AWS Glue Connection

This module sets up an `aws_glue_connection` resource.

## Terraform Version

This module was built and tested with Terraform `1.0.0`.

## Recommended Usage

Create a module directory to instantiate this module. it can be combined with other Glue modules in the same `tf` file and the `outputs` of each module can be used for downstream variables.

### Usage Example

```hcl
## main.tf
locals {
  tags = merge(var.tags,var.more_tags)
}

module "glue_connection" {
  source = "../shared-modules/aws/glue/connection"

  name = var.name

  description     = var.description
  catalog_id      = data.aws_caller_identity.this.account_id
  connection_type = var.connection_type
  match_criteria  = var.match_criteria

  connection_properties   = var.connection_properties
  security_group_id_list  = var.security_group
  subnet_id               = var.subnet_id
  availability_zone       = var.availability_zone

  tags = local.tags
}


```

## Variables

Please review `variables.tf`. the description of each variable denotes if the variable is required or optional and includes a description about the variable function.

> Please ensure you're passing the correct structure for any variable with the type `any`

### Required

```raw
name – (Required) The name you assign to this job. It must be unique in your account.
```