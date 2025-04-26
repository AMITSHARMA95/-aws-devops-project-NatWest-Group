variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair for EC2 instance"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
}

