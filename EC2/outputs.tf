output "ec2_public_ip" {
  value = aws_instance.prj-vm[0].public_ip
}