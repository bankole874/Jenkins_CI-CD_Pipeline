resource "aws_instance" "jenkins" {
  ami                    = "ami-04a81a99f5ec58529"
  instance_type          = "t2.medium"
  subnet_id              = var.public_subnet_id
  security_groups        = [var.public_security_group_id]
  associate_public_ip_address = true
  key_name               = var.ssh_key_name

  tags = {
    Name = "Public-Instance"
  }
}

resource "aws_instance" "sonarqube" {
  ami                    = "ami-04a81a99f5ec58529"
  instance_type          = "t2.medium"
  subnet_id              = var.public_subnet_id
  security_groups        = [var.public_security_group_id]
  associate_public_ip_address = true
  key_name               = var.ssh_key_name

  tags = {
    Name = "Public-Instance"
  }
}

resource "aws_instance" "docker-server" {
  ami                    = "ami-04a81a99f5ec58529"
  instance_type          = "t2.medium"
  subnet_id              = var.public_subnet_id
  security_groups        = [var.public_security_group_id]
  associate_public_ip_address = true
  key_name               = var.ssh_key_name


  tags = {
    Name = "Public-Instance"
  }
}
