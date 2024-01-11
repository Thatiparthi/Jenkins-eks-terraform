variable "region" {
  description = "aws region"
  type        = string

}

variable "environment" {
  description = "aws environment"
  type        = string

}

variable "vpc_cidr" {
  description = "aws vpc cidr range"
  type        = string

}

variable "public_subnets" {
  description = "public subnets for vpc"
  type        = list(string)

}

variable "private_subnets" {
  description = "private subnets for vpc"
  type        = list(string)

}