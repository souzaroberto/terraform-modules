resource "google_container_cluster" "this" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "this" {
  count      = length(var.node_pools)
  name       = var.node_pools[count.index].node_name
  cluster    = google_container_cluster.this.id
  node_count = (var.node_pools[count.index].min_node_count > 0) && (var.node_pools[count.index].max_node_count > 0) ? null : var.node_pools[count.index].node_count

  dynamic "autoscaling" {
    for_each = (var.node_pools[count.index].min_node_count > 0) && (var.node_pools[count.index].max_node_count > 0) ? [1] : []
    content {
      min_node_count = var.node_pools[count.index].min_node_count
      max_node_count = var.node_pools[count.index].max_node_count
    }
  }

  node_config {
    preemptible  = var.node_pools[count.index].preemptible
    machine_type = var.node_pools[count.index].machine_type

    labels = {
      role = var.node_pools[count.index].label
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
