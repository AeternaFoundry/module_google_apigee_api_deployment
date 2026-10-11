resource "google_apigee_api_deployment" "apigee_api_deployments" {
  for_each = var.apigee_api_deployments

  environment     = each.value.environment
  org_id          = each.value.org_id
  proxy_id        = each.value.proxy_id
  revision        = each.value.revision
  deletion_policy = each.value.deletion_policy
  service_account = each.value.service_account

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}

