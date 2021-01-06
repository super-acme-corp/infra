output "image_tag" {
  description = "The image tag deployed to the infrastructure"
  value = var.tag
}

output "url" {
  description = "The URL the application is available on"
  value = var.subdomain
}
