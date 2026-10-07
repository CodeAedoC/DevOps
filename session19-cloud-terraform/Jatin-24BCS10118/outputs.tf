output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "ec2_public_ip" {
  value = aws_instance.web_server.public_ip
}

output "ec2_public_dns" {
  value = aws_instance.web_server.public_dns
}

output "s3_bucket_name" {
  value = aws_s3_bucket.app_assets.id
}
