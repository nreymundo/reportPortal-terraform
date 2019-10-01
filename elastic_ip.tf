resource "aws_eip" "instance_eip" {
  instance = "${aws_instance.ec2_instance.id}"
  vpc      = true
}