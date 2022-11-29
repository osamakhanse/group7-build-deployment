provider "aws" {
  region  = "eu-west-1"
}

resource "null_resource" "name" {

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("x21242887-jenkins.pem")
    host        = "ec2-54-229-142-121.eu-west-1.compute.amazonaws.com"
  }
  provisioner "remote-exec" {
    inline = [
            "mkdir testDir"
    ]
  }
}
