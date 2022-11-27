provider "aws" {
  region  = "eu-west-1"
}

resource "null_resource" "name" {

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("x21242887-jenkins.pem")
    host        = "ec2-34-242-102-85.eu-west-1.compute.amazonaws.com"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir testhello"
    ]
  }
}
