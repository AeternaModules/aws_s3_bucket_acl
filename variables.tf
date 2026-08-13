variable "s3_bucket_acls" {
  description = <<EOT
Map of s3_bucket_acls, attributes below
Required:
    - bucket
Optional:
    - acl
    - expected_bucket_owner
    - region
    - access_control_policy (block):
        - grant (optional, block):
            - grantee (optional, block):
                - email_address (optional)
                - id (optional)
                - type (required)
                - uri (optional)
            - permission (required)
        - owner (required, block):
            - display_name (optional)
            - id (required)
EOT

  type = map(object({
    bucket                = string
    acl                   = optional(string)
    expected_bucket_owner = optional(string)
    region                = optional(string)
    access_control_policy = optional(object({
      grant = optional(list(object({
        grantee = optional(object({
          email_address = optional(string)
          id            = optional(string)
          type          = string
          uri           = optional(string)
        }))
        permission = string
      })))
      owner = object({
        display_name = optional(string)
        id           = string
      })
    }))
  }))
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

