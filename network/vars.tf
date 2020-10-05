
variable "region" {}

variable "network_cidrs" {
  type = map(list(string))
}


variable "bucket" {
  type    = string
  default = ""
}

variable "key" {
  type    = string
  default = ""
}

variable "dynamodb_table" {
  type    = string
  default = ""
}

