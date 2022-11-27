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
    private_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpIOVaSMeAQOssBmGotprKxz8dUpcuLm9vq8F5vlWfQueIEwK21dUSHZDllKF/7lEacUzHIaUgdoM6ULrezUkRPN5TWvcXxAXvIDMNft9w6ZGeVI8w0qX7hOUWk6lHKFFMtijVspE9pYmNhApunG/oEMM0PPHSfLWLbCUruBglFputwdZSPtriw0a1AzoD2BbdvmQ5MIbIRAyEPjQ1mpA1L8EctgeOnuYhXOV/KNGZxLeBGhFpk8RVvkHRClJQqpkCXjFjDGgEcHW9kkfXughHGQ272MC889Li1KLIpm8DaKnekenTdEu1U1daX1iEOJOIkXsWcvDAzY8KtFfkD0q5 x21242887-jenkins"
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mkdir testhello"
    ]
  }
}
