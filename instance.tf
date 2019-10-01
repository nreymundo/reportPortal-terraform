resource "aws_instance" "ec2_instance" {
  ami                     = "${data.aws_ami.amazon_linux.id}"
  instance_type           = "${var.instance_type}"
  key_name                = "${var.ssh_public_key_name}"
  subnet_id               = "${var.subnet}"
  vpc_security_group_ids  = ["${aws_security_group.arm_reportportal_sg.id}"]
  
  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = 50
    volume_type = "gp2"
    delete_on_termination = true
  }

  tags = {
    Name        = "${var.name}"
    OWNER       = "${var.owner}"
    PURPOSE     = "${var.purpose}"
    REPO        = "${var.repo}"
  }
}
