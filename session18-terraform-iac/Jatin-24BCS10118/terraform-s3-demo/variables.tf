variable "aws_region" {
  type        = string
  description = "Target AWS deployment region"
  default     = "us-east-1"
}

variable "bucket_name_prefix" {
  type        = string
  description = "Prefix for the S3 bucket"
  default     = "devops-hero-jatin-24bcs10118"
}

variable "environment" {
  type        = string
  description = "Deployment Environment"
  default     = "dev"
}
