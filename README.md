# Cloud4future-EKS (Sample End-to-End: Terraform + EKS + ECR + Trivy + Deploy)

This repository is a complete sample that deploys:
- **AWS VPC + EKS + ECR + AWS Load Balancer Controller** using **Terraform**
- A simple **Node.js** app built into a Docker image
- **Trivy** image scanning (fails on HIGH/CRITICAL)
- Push to **ECR**
- Deploy to **EKS** (Kubernetes manifests + ALB Ingress)

## Required GitHub Secrets (Repo → Settings → Secrets and variables → Actions)
- `AWS_ROLE_TO_ASSUME` : IAM Role ARN for GitHub OIDC (e.g. `arn:aws:iam::123456789012:role/github-actions-deploy-role`)
- `TF_STATE_BUCKET` : S3 bucket name for Terraform state (must be in same region as AWS_REGION)
- `MY_PUBLIC_IP_CIDR` : Your public IP in CIDR format for EKS API access (e.g. `1.2.3.4/32`)

## Default Region
- `eu-west-2` (London)

## How it runs
A push to `main` triggers:
1) Terraform init/plan/apply (`infra/platform`)
2) Build Docker image (`app/`)
3) Trivy scan (fail on HIGH/CRITICAL)
4) Push to ECR
5) Deploy to EKS + print ALB hostname

## Local quick test (optional)
```bash
cd app
npm install
node src/server.js
# open http://localhost:3000
```

> Note: The CI/CD pipeline works even if you don’t run npm locally.
