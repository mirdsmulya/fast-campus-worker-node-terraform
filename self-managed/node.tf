
module "self_managed_node_group" {
  source = "terraform-aws-modules/eks/aws//modules/self-managed-node-group"

  name                = "fast-campus-self-managed"
  cluster_name        = "fast-campus-cluster"
  cluster_version     = "1.29"
  subnet_ids = ["subnet-0bb70691292e64ea7", "subnet-0ea42188dd8e1483e", "subnet-07ce57e703be85c3b"]

  // The following variables are necessary if you decide to use the module outside of the parent EKS module context.
  // Without it, the security groups of the nodes are empty and thus won't join the cluster.
  vpc_security_group_ids = [
    module.eks.cluster_primary_security_group_id,
    module.eks.cluster_security_group_id
  ]
  cluster_service_cidr = "192.168.1.0/20"

  min_size     = 1
  max_size     = 10
  desired_size = 1

  launch_template_name   = "separate-self-mng"
  instance_type          = "t3.small"



  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}