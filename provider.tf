provider "aws" {
  region  = "eu-west-1"
}

resource "aws_instance" "example" {
  key_name      = "x21242887-jenkins"
  ami           = "ami-096800910c1b781ba"
  instance_type = "t2.micro"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/authorized_keys")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir testhello"
    ]
  }
}
