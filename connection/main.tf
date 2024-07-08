resource "aws_glue_connection" "this" {
  name = var.name

  description     = var.description
  catalog_id      = var.catalog_id
  connection_type = var.connection_type
  match_criteria  = var.match_criteria

  connection_properties = var.connection_properties

  physical_connection_requirements {
    availability_zone      = var.availability_zone
    security_group_id_list = var.security_group_id_list
    subnet_id              = var.subnet_id
  }

  tags = var.tags

  lifecycle {
    create_before_destroy = true
    ignore_changes        = []
  }
}