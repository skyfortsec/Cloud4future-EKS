variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "project" {
  type    = string
  default = "cloud4future"
}

variable "cluster_name" {
  type    = string
  default = "cloud4future-eks"
}

variable "vpc_cidr" {
  type    = string
  default = "10.20.0.0/16"
}

variable "my_public_ip_cidr" {
  type        = string
  description = "Your public IP in CIDR, e.g. 1.2.3.4/32"
}

variable "github_actions_role_arn" {
  type        = string
  description = "Role ARN assumed by GitHub Actions (OIDC). Used to grant EKS cluster admin access."
}
