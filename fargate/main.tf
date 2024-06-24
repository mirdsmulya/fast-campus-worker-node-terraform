module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name                   = local.name
  cluster_version                = local.cluster_version
  cluster_endpoint_public_access = true

  cluster_addons = {
    kube-proxy = {}
    vpc-cni    = {}
    coredns = {
      configuration_values = jsonencode({
        computeType = "fargate"
      })
    }
  }

  vpc_id                   = "vpc-00feacb6d220c5212"
  # use Private subnets for Fargate
  subnet_ids               = ["subnet-0dafcf4bc750dc82b", "subnet-02549f63db4c7d756", "subnet-09b1c9f4a6287d443"] 
  control_plane_subnet_ids = ["subnet-0bb70691292e64ea7", "subnet-0ea42188dd8e1483e", "subnet-07ce57e703be85c3b"]

  # Fargate profiles use the cluster primary security group so these are not utilized
  create_cluster_security_group = false
  create_node_security_group    = false

  fargate_profiles = {
    # eks_cluster_name = local.name
    example = {
      eks_cluster_name = local.name
      name = "example"
      selectors = [
        {
          namespace = "backend"
          labels = {
            Application = "backend"
          }
        },
        {
          namespace = "app-*"
          labels = {
            Application = "app-wildcard"
          }
        }
      ]

      # Using specific subnets instead of the subnets supplied for the cluster itself
      # use Private subnets for Fargate
      subnets = ["subnet-0dafcf4bc750dc82b", "subnet-02549f63db4c7d756", "subnet-09b1c9f4a6287d443"]

      tags = {
        Owner = "secondary"
      }
    }
    kube-system = {
      selectors = [
        { namespace = "kube-system" }
      ]
    }
  }

  tags = local.tags
}