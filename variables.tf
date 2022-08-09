variable "name" {
  type    = string
  default = "ecr"
}

variable "image_tag_mutability" {
  type    = string
  default = "IMMUTABLE"
}


variable "countnumber" {
  type    = number
  default = 10
}