variable "apigee_api_deployments" {
  description = <<EOT
Map of apigee_api_deployments, attributes below
Required:
    - environment
    - org_id
    - proxy_id
    - revision
Optional:
    - deletion_policy
    - service_account
    - timeouts (block):
        - create (optional)
        - delete (optional)
EOT

  type = map(object({
    environment     = string
    org_id          = string
    proxy_id        = string
    revision        = string
    deletion_policy = optional(string)
    service_account = optional(string)
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
}

