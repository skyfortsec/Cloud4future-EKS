provider "aws" {
  region = var.region
}

data "aws_availability_zones" "azs" {
  state = "available"
}

# EKS cluster details (available after cluster creation)
data "aws_eks_cluster" "this" {
  name       = module.eks.cluster_name
  depends_on = [module.eks]
}

data "aws_eks_cluster_auth" "this" {
  name       = module.eks.cluster_name
  depends_on = [module.eks]
}

# Kubernetes provider
provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.this.token
}

# Helm provider (NO nested kubernetes {} block)
provider "helm" {
  kubernetes_host                   = data.aws_eks_cluster.this.endpoint
  kubernetes_cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
  kubernetes_token                  = data.aws_eks_cluster_auth.this.token
}
