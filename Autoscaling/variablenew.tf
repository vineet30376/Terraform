variable "region" {
  description = "The AWS region"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

variable "aws_region" {
  description = "AWS region for the cluster"
  type        = "string"
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instances"
  type        = "string"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = "string"
}

variable "name" {
  description = "AutoScaling Group name"
  type        = "string"
}

variable "max_size" {
  description = "Maximum number of instances in the AutoScaling Group"
  type        = "string"
}

variable "min_size" {
  description = "Minimum number of instances in the AutoScaling Group"
  type        = "string"
}

variable "subnet_ids" {
  description = "List of subnet IDs"
  type        = "list"
}

variable "tags" {
  default     = {}
  description = "Tags to attach to the AutoScaling Group and related resources"
  type        = "map"
}