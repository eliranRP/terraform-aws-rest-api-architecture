
variable "region" {
  description = "aws region to deploy to"
  type        = string
}

variable "zone_id" {
  description = "The id of the parent Route53 zone to use for the distribution."
  type        = string
  default     = null
}
variable "acm_request_certificate_arn" {
  description = "Certificate manager ARN"
  type        = string
  default     = null
}
variable "domain_name" {
  type        = string
  description = "A domain name for which the certificate should be issued"
  default     = null
}
variable "platform_name" {
  description = "The name of the platform"
  type        = string
}

variable "app_port" {
  description = "Application port"
  type        = number
}

variable "app_name" {
  type        = string
  description = "Application Name"
}

variable "instance_type" {
  type        = string
  description = "Instances type"
}


variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones for the selected region"
}



variable "vpc_id" {
  type        = string
  description = "VPC ID where subnets will be created (e.g. `vpc-aceb2723`)"
}


variable "private_route_table_ids" {
  type        = list(string)
  description = "IDs of the created private route tables"
}

variable "context" {
  type = any
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "IDs of the created private subnets"
}

variable "associated_security_group_ids" {
  type        = string
  default = "null"
  description = "IDs for private subnets"
}