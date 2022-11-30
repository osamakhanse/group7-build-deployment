provider "aws" {
  region  = "eu-west-1"
}
resource "null_resource" "name" {
  
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("x21242887-jenkins.pem")
    host        = "ec2-63-35-237-106.eu-west-1.compute.amazonaws.com"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl stop aoedjango",
      "sudo rm -r AOE"
    ]
  }
  
  provisioner "file" {
    source      = "AOE_django-main"
    destination = "AOE"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("x21242887-jenkins.pem")
      host        = "ec2-63-35-237-106.eu-west-1.compute.amazonaws.com"

    }
    
  }
  
   provisioner "remote-exec" {
    inline = [
      "cd AOE",
      "sudo python3 -m venv env",
      "sudo source env/bin/activate",
      "pip install django gunicorn psycopg2-binary",
      "pip install django==4.1.3",
      "python3 manage.py makemigrations",
      "python3 manage.py migrate",
      "sudo systemctl start aoedjango",
      "sudo systemctl enable aoedjango"
    ]
  }
  
}

