variable "aws_region" {
  type        = string
  description = "The AWS region to put the bucket into"
}

variable "create" {
  description = "Whether to create Route53 zone"
  type        = bool
  default     = true
}

variable "zones" {
  description = "Map of Route53 zone parameters"
  type        = map(any)
  default     = {}
}

variable "tags" {
  description = "Tags added to all zones. Will take precedence over tags from the 'zones' variable"
  type        = map(any)
  default = {
    Terraform = "true"
  }
}