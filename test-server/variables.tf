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
variable "bucket" {
  description = "aws s3 bucket creating"
  type        = string

}
variable "instance_type" {
  description = "attached aws instance type"
  type        = string

}
variable "key_name" {
  description = "add the keypair to connect the instance"
  type        = string

}