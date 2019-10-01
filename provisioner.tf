resource "null_resource" "provisioner" {
  triggers = {
    public_ip = "${aws_eip.instance_eip.public_ip}"
  }

  connection {
    type = "ssh"
    host = "${aws_eip.instance_eip.public_ip}"
    user = "${var.ssh_user}"
    port = "${var.ssh_port}"
    private_key = "${file(var.ssh_private_key_path)}"
    agent = false
  }

  // Copies asset files for remote provisioning
  provisioner "file" {
    source      = "files"
    destination = "/home/ec2-user/"
  }
  
  // Triggers the provisioning process. 
  provisioner "remote-exec" {
    inline = [
      "chmod -R +x ~/files/*.sh && ~/files/bootstrap.sh",
    ]
  }
}
