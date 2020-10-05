

variable "aws_region" {
  type = string
  default = "eu-west-1"
}


variable "state_name" {
  type = string
}

# Optional tags to pass to the module
variable "tags" {
  type = map
  default = {}
}