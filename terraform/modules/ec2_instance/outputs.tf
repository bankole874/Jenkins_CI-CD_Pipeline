output "public_instance_id_jenkins" {
  description = "The ID of the public EC2 instance"
  value       = aws_instance.jenkins.id
}

output "public_instance_id_sonarqube" {
  description = "The ID of the public EC2 instance"
  value       = aws_instance.sonarqube.id
}

output "public_instance_id_docker_server" {
  description = "The ID of the public EC2 instance"
  value       = aws_instance.docker-server.id
}