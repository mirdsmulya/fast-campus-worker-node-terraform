output "cluster_primary_security_group_id" {
  description = "The primary security group for the cluster control plane"
  value       = module.eks.cluster_primary_security_group_id
}

output "cluster_security_group_id" {
  description = "The security group for the cluster"
  value       = module.eks.cluster_security_group_id
}