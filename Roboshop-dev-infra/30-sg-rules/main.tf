# resource "aws_security_group_rule" "frontend_frontend_alb" {
#     security_group_id = module.sg[9].sg_id
#     type = "ingress"
#     from_port = 80
#     source_security_group_id = module.sg[11].sg_id
#     protocol = "tcp"
#     to_port = 80

# }

resource "aws_security_group_rule" "backend_alb_frontend" {
    type = "ingress"
    security_group_id = local.backend_alb_sg_id
    from_port = 80
    source_security_group_id = local.bastion_sg_id
    protocol = "tcp"
    to_port = 80

}

resource "aws_security_group_rule" "bastion_laptop" {
    type = "ingress"
    security_group_id = local.bastion_sg_id
    cidr_blocks = ["0.0.0.0/0"]
    from_port = 22
    protocol = "tcp"
    to_port = 22

}