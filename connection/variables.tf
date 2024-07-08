variable "environment" {
  type        = string
  description = "Environment name"
  default     = null
}

variable "name" {
  type        = string
  description = "(Required) The name of the connection. It must be unique in your account."
  default     = null
}

variable "catalog_id" {
  type        = string
  description = "(Optional) The ID of the Data Catalog in which to create the connection. If none is supplied, the AWS account ID is used by default."
  default     = null
}

variable "connection_properties" {
  type        = map(any)
  description = "(Optional) A map of key-value pairs used as parameters for this connection."
  default     = null
}

variable "connection_type" {
  type        = string
  description = "(Optional) The type of the connection. Supported are: JDBC, MONGODB, KAFKA, and NETWORK. Defaults to JDBC."
  default     = "NETWORK"
}

variable "description" {
  type        = string
  description = "(Optional) Description of the job."
  default     = null
}

variable "match_criteria" {
  type        = list(string)
  description = "(Optional) A list of criteria that can be used in selecting this connection."
  default     = []
}

variable "physical_connection_requirements" {
  type        = map(any)
  description = "(Optional) A map of physical connection requirements, such as VPC and SecurityGroup. Defined below."
  default     = {}
}

variable "security_group_id_list" {
  type        = list(string)
  description = "(Optional) The security group ID list used by the connection."
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "(Optional) The subnet ID used by the connection."
  default     = null
}

variable "availability_zone" {
  type        = string
  description = "(Optional) The availability zone of the connection. This field is redundant and implied by subnet_id, but is currently an api requirement."
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "(Optional) A map of tags to assign to the resource."
  default     = null

}