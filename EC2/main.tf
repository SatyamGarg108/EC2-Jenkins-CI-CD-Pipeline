resource "aws_instance" "prj-vm" {
  ami                    = var.ami_value
  instance_type          = var.instance_type
  count                  = 1
  subnet_id              = var.subnet_id_value
  key_name               = var.key_name  # Use the existing key pair name here
  vpc_security_group_ids = [var.security_group_value]

  associate_public_ip_address = true

  tags = {
    Name = "Satyam_Docker-server-${count.index}"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras enable epel
              yum clean metadata
              yum install -y epel-release
              yum install -y ansible python3
              EOF
}

resource "tls_private_key" "rsa_4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa_4096.public_key_openssh
}

resource "local_file" "private_key" {
  content              = tls_private_key.rsa_4096.private_key_pem
  filename             = var.key_name
  file_permission      = "0600" # 👈 Secure permissions
  directory_permission = "0700"
}

resource "null_resource" "wait_for_ssh" {
  depends_on = [aws_instance.prj-vm]

  provisioner "local-exec" {
    command = <<EOT
IP=${aws_instance.prj-vm[0].public_ip}
ATTEMPT=1
MAX_ATTEMPTS=30
while ! ssh -i ./${var.key_name} -o StrictHostKeyChecking=no -o ConnectTimeout=5 ec2-user@$IP 'exit' 2>/dev/null; do
  echo "[$ATTEMPT/$MAX_ATTEMPTS] Waiting for SSH on $IP..."
  if [ "$ATTEMPT" -ge "$MAX_ATTEMPTS" ]; then
    echo "ERROR: Timed out waiting for SSH."
    exit 1
  fi
  ATTEMPT=$((ATTEMPT+1))
  sleep 5
done
EOT
  }
}

resource "null_resource" "generate_inventory" {
  depends_on = [aws_instance.prj-vm]

  provisioner "local-exec" {
    command = <<EOT
      echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Generating inventory file!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      chmod 600 ./${var.key_name}
      echo "[webservers]" > Ansible/inventory.ini
      echo "${aws_instance.prj-vm[0].public_ip} ansible_user=ec2-user ansible_ssh_private_key_file=./${var.key_name}" >> Ansible/inventory.ini
      echo "Current directory: $(pwd)"
      echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!DONE Generating inventory file!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    EOT
  }
}

resource "null_resource" "run_nginx_setup_playbook" {
  depends_on = [null_resource.wait_for_ssh]

  provisioner "local-exec" {
  command = <<EOT
echo "Using key: ./${var.key_name}"
echo "Trying to SSH into: ${aws_instance.prj-vm[0].public_ip}"
chmod 600 ./${var.key_name}
ansible-playbook Ansible/nginx_setup.yml -i Ansible/inventory.ini --ssh-extra-args='-o StrictHostKeyChecking=no -o ConnectTimeout=5'
EOT
}

}