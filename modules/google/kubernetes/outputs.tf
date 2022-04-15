output "master_ip" {
  value = google_container_cluster.this.endpoint
}

output "cluster_name" {
  value = google_container_cluster.this.name
}

output "project" {
  value = google_container_cluster.this.project
}

output "zone" {
  value = google_container_cluster.this.location
}
