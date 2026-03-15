output "id" {
  description = "ID of the bucket."
  value       = aws_s3_bucket.this.id
}

output "arn" {
  description = "ARN of the bucket."
  value       = aws_s3_bucket.this.arn
}

output "bucket" {
  description = "Name of the bucket."
  value       = aws_s3_bucket.this.bucket
}

output "bucket_regional_domain_name" {
  description = "Regional domain name of the bucket."
  value       = aws_s3_bucket.this.bucket_regional_domain_name
}

output "bucket_domain_name" {
  description = "Domain name of the bucket."
  value       = aws_s3_bucket.this.bucket_domain_name
}
