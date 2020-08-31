# Create the EKS cluster


module "dp-sandbox-eks"
  source                               = "git::https://github.com/terraform-aws-modules/terraform-aws-eks?ref=v12.2.0"
  cluster_name                         = var.eks_cluster_name
  cluster_version                      = "1.17"
  vpc_id  = #todo
  subnets = #todo
  config_output_path                   = "./"
  worker_groups_launch_template = [
    {
      name                    = "woker-group"
      instance_types          =  "t3.large"
      spot_instance_pools     = 4
      asg_max_size            = 5
      asg_min_size            = 3
      asg_desired_capacity    = 5
      autoscaling_enabled     = "true"
      kubelet_extra_args      = "--node-labels=node.kubernetes.io/lifecycle=spot"
      public_ip               = true
    },
  ]
}













# TO DO 
# module eks :
# - worker_additional_security_group_ids
# - workers_additional_policies 