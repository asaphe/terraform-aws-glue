# terraform-aws-glue

Terraform modules for managing AWS Glue resources.

## Submodules

| Module | Description |
|--------|-------------|
| [connection](./connection) | AWS Glue Connection |
| [db](./db) | AWS Glue Catalog Database |
| [job](./job) | AWS Glue Job |
| [table](./table) | AWS Glue Catalog Table |
| [trigger](./trigger) | AWS Glue Trigger |

## Usage

### Glue Job

```hcl
module "glue_job" {
  source = "github.com/asaphe/terraform-aws-glue//job"

  name        = "my-etl-job"
  role_arn    = "arn:aws:iam::123456789012:role/glue-role"
  description = "ETL job for data processing"

  command = {
    name            = "glueetl"
    script_location = "s3://my-bucket/scripts/etl.py"
    python_version  = "3"
  }

  glue_version      = "4.0"
  worker_type       = "G.1X"
  number_of_workers = 2

  tags = {
    Environment = "production"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.7 |
| aws | >= 5.0 |

## License

Apache 2.0 - See [LICENSE](./LICENSE) for details.
