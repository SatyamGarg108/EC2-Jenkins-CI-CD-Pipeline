#!/bin/bash

# Exit on any error
set -e

# Get the public IP from Terraform
EC2_PUBLIC_IP=$(terraform output -raw ec2_public_ip)

# Generate the inventory.ini file
cat <<EOF > Ansible/inventory.ini
[webservers]
$EC2_PUBLIC_IP ansible_user=ec2-user ansible_ssh_private_key_file=./docker.pem
EOF

echo "[✓] inventory.ini created successfully with IP: $EC2_PUBLIC_IP"