output "cluster_name" { value = module.eks.cluster_name }
output "region" { value = var.region }
output "ecr_repo_url" { value = aws_ecr_repository.app.repository_url }
output "ecr_repo_name" { value = aws_ecr_repository.app.name }
