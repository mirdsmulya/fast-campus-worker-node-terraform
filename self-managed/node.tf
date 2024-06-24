
module "self_managed_node_group" {
  source = "terraform-aws-modules/eks/aws//modules/self-managed-node-group"

  name                = "fast-campus-self-managed"
  cluster_name        = local.cluster_name
  cluster_version     = local.cluster_version
  subnet_ids          = local.subnet_ids

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
  instance_type          = local.instance_types



  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}