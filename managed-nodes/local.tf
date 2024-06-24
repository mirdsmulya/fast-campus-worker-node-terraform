locals {
    cluster_name = "fast-campus-cluster-managed"
    cluster_version = "1.29"
    vpc_id = "vpc-00feacb6d220c5212"
    subnet_ids = ["subnet-0b1e99ef139f6ce5c", "subnet-01230307ad1145140", "subnet-0eb072d20a5aeb00b"]
    control_plane_subnet_ids = ["subnet-0b1e99ef139f6ce5c", "subnet-01230307ad1145140", "subnet-0eb072d20a5aeb00b"]
    instance_types = ["t3.small"]
}

