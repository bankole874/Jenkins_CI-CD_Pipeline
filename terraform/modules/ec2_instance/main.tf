resource "aws_key_pair" "my_key" {
  key_name   = "cicd_key_rsa"
  public_key = file("${path.module}/../../cicd_key_rsa.pub")
}

resource "aws_instance" "jenkins" {
  ami                    = "ami-04a81a99f5ec58529"
  instance_type          = "t2.medium"
  subnet_id              = var.public_subnet_id
  security_groups        = [var.public_security_group_id]
  associate_public_ip_address = true
  key_name               = aws_key_pair.my_key.key_name

  user_data = file("${path.module}/../../scripts/install_jenkins.sh")

  tags = {
    Name = "jenkins"
  }
}

resource "aws_instance" "sonarqube" {
  ami                    = "ami-04a81a99f5ec58529"
  instance_type          = "t2.medium"
  subnet_id              = var.public_subnet_id
  security_groups        = [var.public_security_group_id]
  associate_public_ip_address = true
  key_name               = aws_key_pair.my_key.key_name

  # user_data = file("${path.module}/../../scripts/install_jenkins.sh")

  tags = {
    Name = "sonarqube"
  }
}

resource "aws_instance" "docker-server" {
  ami                    = "ami-04a81a99f5ec58529"
  instance_type          = "t2.medium"
  subnet_id              = var.public_subnet_id
  security_groups        = [var.public_security_group_id]
  associate_public_ip_address = true
  key_name               = aws_key_pair.my_key.key_name

  user_data = file("${path.module}/../../scripts/install_docker.sh")

  tags = {
    Name = "docker-server"
  }
}
