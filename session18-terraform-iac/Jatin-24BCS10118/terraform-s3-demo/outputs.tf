output "s3_bucket_id" {
  description = "Unique Identifier of the created S3 Bucket"
  value       = aws_s3_bucket.demo_bucket.id
}

output "s3_bucket_arn" {
  description = "Amazon Resource Name (ARN) of the S3 Bucket"
  value       = aws_s3_bucket.demo_bucket.arn
}

output "s3_bucket_region" {
  description = "AWS Region hosting the S3 Bucket"
  value       = aws_s3_bucket.demo_bucket.region
}
