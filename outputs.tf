output "s3_bucket_acls_id" {
  description = "Map of id values across all s3_bucket_acls, keyed the same as var.s3_bucket_acls"
  value       = { for k, v in aws_s3_bucket_acl.s3_bucket_acls : k => v.id if v.id != null && length(v.id) > 0 }
}
output "s3_bucket_acls_access_control_policy" {
  description = "Map of access_control_policy values across all s3_bucket_acls, keyed the same as var.s3_bucket_acls"
  value       = { for k, v in aws_s3_bucket_acl.s3_bucket_acls : k => one(v.access_control_policy) if v.access_control_policy != null && length(v.access_control_policy) > 0 }
}
output "s3_bucket_acls_acl" {
  description = "Map of acl values across all s3_bucket_acls, keyed the same as var.s3_bucket_acls"
  value       = { for k, v in aws_s3_bucket_acl.s3_bucket_acls : k => v.acl if v.acl != null && length(v.acl) > 0 }
}
output "s3_bucket_acls_bucket" {
  description = "Map of bucket values across all s3_bucket_acls, keyed the same as var.s3_bucket_acls"
  value       = { for k, v in aws_s3_bucket_acl.s3_bucket_acls : k => v.bucket if v.bucket != null && length(v.bucket) > 0 }
}
output "s3_bucket_acls_expected_bucket_owner" {
  description = "Map of expected_bucket_owner values across all s3_bucket_acls, keyed the same as var.s3_bucket_acls"
  value       = { for k, v in aws_s3_bucket_acl.s3_bucket_acls : k => v.expected_bucket_owner if v.expected_bucket_owner != null && length(v.expected_bucket_owner) > 0 }
}
output "s3_bucket_acls_region" {
  description = "Map of region values across all s3_bucket_acls, keyed the same as var.s3_bucket_acls"
  value       = { for k, v in aws_s3_bucket_acl.s3_bucket_acls : k => v.region if v.region != null && length(v.region) > 0 }
}

