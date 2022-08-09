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


variable "tags" {
  default     = {}
  description = "A map of tags to add to all resources"
  type        = map(string)
}