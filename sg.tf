resource "aws_security_group" "arm_reportportal_sg" {
  name        = "${var.name}-sg"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = "${var.trusted_cidrs}"
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = "${var.trusted_cidrs}"
  }

  ingress {
    from_port   = 8500
    to_port     = 8500
    protocol    = "TCP"
    cidr_blocks = "${var.trusted_cidrs}"
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.name}"
    OWNER       = "${var.owner}"
    PURPOSE     = "${var.purpose}"
    REPO        = "${var.repo}"
  }
}
