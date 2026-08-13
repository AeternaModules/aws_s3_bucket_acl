resource "aws_s3_bucket_acl" "s3_bucket_acls" {
  for_each = var.s3_bucket_acls

  bucket                = each.value.bucket
  acl                   = each.value.acl
  expected_bucket_owner = each.value.expected_bucket_owner
  region                = each.value.region

  dynamic "access_control_policy" {
    for_each = each.value.access_control_policy != null ? [each.value.access_control_policy] : []
    content {
      dynamic "grant" {
        for_each = access_control_policy.value.grant != null ? access_control_policy.value.grant : []
        content {
          dynamic "grantee" {
            for_each = grant.value.grantee != null ? [grant.value.grantee] : []
            content {
              email_address = grantee.value.email_address
              id            = grantee.value.id
              type          = grantee.value.type
              uri           = grantee.value.uri
            }
          }
          permission = grant.value.permission
        }
      }
      owner {
        display_name = access_control_policy.value.owner.display_name
        id           = access_control_policy.value.owner.id
      }
    }
  }
}

