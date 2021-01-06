variable "aws_region" {
  default     = "eu-west-1"
  description = "The AWS region to provision this application"
  type        = string
}

variable "app_name" {
  description = "The name of the application to provision"
  type        = string
}

variable "app_port" {
  description = "The application port to map to port 80 in the ALB."
}

variable "domain" {
  description = "The apex domain for the network"
}

variable "subdomain" {
  description = "The subdomain the application is available on"
}

variable "registry" {
  description = "The Docker registry providing the application image"
  type        = string
}

variable "registry_username" {
  description = "The username for the Docker registry"
  type        = string
}

variable "registry_password" {
  description = "The password for the Docker registry"
  sensitive   = true
  type        = string
}

variable "image" {
  description = "The name of the Docker image to deploy"
  type        = string
}

variable "tag" {
  description = "The image tag to deploy"
  default     = "latest"
  type        = string
}
