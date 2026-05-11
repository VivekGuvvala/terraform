# # Using Open source module
# module "catalogue" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "${local.common_name_suffix}-catalogue"
#   use_name_prefix = false
#   description = "Security group for catalogue with custom ports open within VPC, egress all traffic"
#   vpc_id      = data.aws_ssm_parameter.vpc_id.value

# }

module "sg" {
  count = length(var.sg_names)
  source = "git::https://github.com/VivekGuvvala/terraform-aws-sg.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = var.sg_names[count.index]
  sg_description = "created for ${var.sg_names[count.index]}"
  vpc_id = local.vpc_id
}

#here we are creating resource, frontend accepting traffic from frontend ALB
# so we need to add in inbound rules to frontend..need to add frontend alb sg
# resource "aws_security_group_rule" "frontend_frontend_alb" {
#     security_group_id = module.sg[9].sg_id
#     type = "ingress"
#     from_port = 80
#     source_security_group_id = module.sg[11].sg_id
#     protocol = "tcp"
#     to_port = 80

# }