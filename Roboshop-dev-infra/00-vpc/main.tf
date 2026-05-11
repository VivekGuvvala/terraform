module "vpc" {
    # source = "../terraform-AWS-VPC"
    source = "git::https://github.com/VivekGuvvala/terraform-AWS-VPC.git?ref=main"
    # vpc_cidr = "10.0.0.0/16"
    # project_name = "roboshop"
    # environment = "dev"

    vpc_cidr = var.vpc_cidr
    project_name = var.project_name
    environment = var.environment
    vpc_tags = var.vpc_tags
    igw_tags = var.igw_tags
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    database_subnet_cidrs = var.database_subnet_cidrs

    is_peering_required = true
}

# data "aws_availability_zones" "available" {
#   state = "available"
# }