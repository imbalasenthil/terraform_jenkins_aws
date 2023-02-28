# Creates and outputs the bucket_domain_name, s3_bucket_uri, and instance_public_ip.
output "bucket_domain_name" {
  description = "FQDN of bucket"
  value       = "https://${aws_s3_bucket.s3.bucket_domain_name}"
}

output "s3_bucket_uri" {
  description = "S3 bucket URI"
  value       = "s3://${aws_s3_bucket.s3.id}"
}

output "instance_public_ip" {
  value = aws_instance.ec2_instance.public_ip
}