# terraform-aws-s3-bucket

## What it does

- Server-side encryption (AES256 or KMS)
- Public access blocked
- Ownership controls (BucketOwnerEnforced by default)
- Versioning (Enabled/Suspended)
- ACL (with validation against ownership)
- Bucket policy (injectable JSON)
- Access logging
- Static website hosting (incompatible with CloudFront OAC)

## Usage

```hcl
module "website" {
  source = "github.com/kquentin/terraform-aws-s3-bucket"

  name       = "my-website"
  versioning = true

  tags = {
    Environment = "production"
  }
}
```

## Inputs

| Name | Type | Default | Required |
|------|------|---------|----------|
| name | string | | yes |
| force_destroy | bool | false | no |
| object_ownership | string | BucketOwnerEnforced | no |
| acl | string | null | no |
| policy | string | null | no |
| kms_key_id | string | null | no |
| versioning | bool | false | no |
| logging | object | null | no |
| website | object | null | no |
| tags | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| id | Bucket ID |
| arn | Bucket ARN |
| bucket | Bucket name |
| bucket_regional_domain_name | Regional domain name |
| bucket_domain_name | Domain name |
