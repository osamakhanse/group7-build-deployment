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
      host        = "ec2-34-244-92-217.eu-west-1.compute.amazonaws.com"

    }
    
  }
  
   provisioner "remote-exec" {
    inline = [
      "cd AOE",
      "python3 -m venv env",
      "source env/bin/activate",
      "pip install django gunicorn psycopg2-binary",
      "pip install django==4.1.3",
      "python3 manage.py makemigrations",
      "python3 manage.py migrate",
      "python3 manage.py runserver 0.0.0.0:8000"
    ]
  }
  
}

