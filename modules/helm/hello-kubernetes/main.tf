resource "helm_release" "this" {
  name             = var.release_name
  repository       = var.repository
  chart            = var.chart_name
  values           = var.values_files
  create_namespace = var.create_namespace
  wait             = var.wait
  atomic           = var.atomic
  cleanup_on_fail  = var.cleanup_on_fail
}
