output "master_ip" {
  value = google_container_cluster.this.endpoint
}

output "cluster_name" {
  value = google_container_cluster.this.name
}