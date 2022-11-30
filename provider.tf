provider "aws" {
  region  = "eu-west-1"
}
resource "null_resource" "name" {
  
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("x21242887-jenkins.pem")
    host        = "ec2-34-244-92-217.eu-west-1.compute.amazonaws.com"
  }

  provisioner "remote-exec" {
    inline = [
      "suro rm -r AOE"
    ]
  }
  
  provisioner "file" {
    source      = "AOE_django-main"
    destination = "AOE"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("x21242887-jenkins.pem")
      host        = "ec2-34-244-92-217.eu-west-1.compute.amazonaws.com"

    }
    
  }
  
   provisioner "remote-exec" {
    inline = [
      "sudo mkdir appsteam7-5"
    ]
  }
  
}

