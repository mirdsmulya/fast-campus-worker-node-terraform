locals {
    name = "fast-campus-cluster-fargate"
    tags = {
        Name = "fast-campus-fargate-cluster"
    }
    cluster_version = "1.29"
    vpc_id = "vpc-00feacb6d220c5212"
    subnet_ids = ["subnet-0dafcf4bc750dc82b", "subnet-02549f63db4c7d756", "subnet-09b1c9f4a6287d443"]
    control_plane_subnet_ids = ["subnet-0bb70691292e64ea7", "subnet-0ea42188dd8e1483e", "subnet-07ce57e703be85c3b"]
}