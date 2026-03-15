variable "name" {
  type        = string
  description = "Name of the S3 bucket."
}

variable "force_destroy" {
  type        = bool
  description = "Allow bucket deletion even if it contains objects."
  default     = false
}

variable "object_ownership" {
  type        = string
  description = "Object ownership setting."
  default     = "BucketOwnerEnforced"

  validation {
    condition     = contains(["BucketOwnerEnforced", "BucketOwnerPreferred", "ObjectWriter"], var.object_ownership)
    error_message = "Allowed values: BucketOwnerEnforced, BucketOwnerPreferred, ObjectWriter."
  }
}

variable "acl" {
  type        = string
  description = "ACL to apply to the bucket. Requires object_ownership != BucketOwnerEnforced."
  default     = null

  validation {
    condition     = var.acl == null || var.object_ownership != "BucketOwnerEnforced"
    error_message = "ACL cannot be set when object_ownership is BucketOwnerEnforced."
  }
}

variable "policy" {
  type        = string
  description = "JSON bucket policy to attach. If null, no policy is created."
  default     = null
}

variable "kms_key_id" {
  type        = string
  description = "KMS key ID for server-side encryption. If null, AES256 is used."
  default     = null
}

variable "versioning" {
  type        = bool
  description = "Enable versioning on the bucket."
  default     = false
}

variable "logging" {
  type = object({
    target_bucket = string
    target_prefix = optional(string, "log/")
  })
  description = "S3 access logging configuration. If null, logging is disabled."
  default     = null
}

variable "website" {
  type = object({
    index_document = optional(string, "index.html")
    error_document = optional(string)
  })
  description = <<-EOF
    Static website hosting configuration. If null, website hosting is disabled.
    Incompatible with CloudFront OAC (use custom origin instead).
  EOF
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the bucket."
  default     = {}
}
