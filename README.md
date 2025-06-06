Provisioned AWS infra using Terraform for **Continuous integration and continuous deployment (CI/CD)** using a powerful combination of Jenkins, Ansible, Docker, and GitHub Webhooks, all running on the Amazon Web Services (AWS) cloud platform.


**AWS Infra Creation:**
https://github.com/Keerthibb/Terraform-Jenkins-Ansible-Docker-CI-CD-Pipeline/tree/main/VPC


![image](https://github.com/Keerthibb/Terraform-Jenkins-Ansible-Docker-CI-CD-Pipeline/assets/92278245/21d9de1a-316b-43b9-8324-6d962d848ea1)



![job-Terraform-Jenkins-AWS-CI-CD-Pipeline-12-console](https://github.com/Keerthibb/Terraform-Jenkins-Ansible-Docker-CI-CD-Pipeline/assets/92278245/3c200225-41fd-43ae-834e-e1fad8234246)



**AWS-EC2 Creation:** https://github.com/Keerthibb/Terraform-Jenkins-Ansible-Docker-CI-CD-Pipeline/tree/main/EC2



[Uploading EC2-Ckeerthi@KBB-LT:~/Terraform-Jenkins-Bash-Ansible-Docker-CI-CD-Pipeline/EC2$ terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.prj-vm[0] will be created
  + resource "aws_instance" "prj-vm" {
      + ami                                  = "ami-080e1f13689e07408"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.medium"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "docker"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = "subnet-0c526506073c4193c"
      + tags                                 = {
          + "Name" = "Docker-server-0"
        }
      + tags_all                             = {
          + "Name" = "Docker-server-0"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = [
          + "sg-052205f767c3be340",
        ]
    }

  # aws_instance.prj-vm[1] will be created
  + resource "aws_instance" "prj-vm" {
      + ami                                  = "ami-080e1f13689e07408"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.medium"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "docker"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = "subnet-0c526506073c4193c"
      + tags                                 = {
          + "Name" = "Docker-server-1"
        }
      + tags_all                             = {
          + "Name" = "Docker-server-1"
        }
      + tenancy                              = (known after apply)
      + user_data                            = (known after apply)
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = [
          + "sg-052205f767c3be340",
        ]
    }

  # aws_key_pair.key_pair will be created
  + resource "aws_key_pair" "key_pair" {
      + arn             = (known after apply)
      + fingerprint     = (known after apply)
      + id              = (known after apply)
      + key_name        = "docker"
      + key_name_prefix = (known after apply)
      + key_pair_id     = (known after apply)
      + key_type        = (known after apply)
      + public_key      = (known after apply)
      + tags_all        = (known after apply)
    }

  # local_file.private_key will be created
  + resource "local_file" "private_key" {
      + content              = (sensitive value)
      + content_base64sha256 = (known after apply)
      + content_base64sha512 = (known after apply)
      + content_md5          = (known after apply)
      + content_sha1         = (known after apply)
      + content_sha256       = (known after apply)
      + content_sha512       = (known after apply)
      + directory_permission = "0777"
      + file_permission      = "0777"
      + filename             = "docker"
      + id                   = (known after apply)
    }

  # tls_private_key.rsa_4096 will be created
  + resource "tls_private_key" "rsa_4096" {
      + algorithm                     = "RSA"
      + ecdsa_curve                   = "P224"
      + id                            = (known after apply)
      + private_key_openssh           = (sensitive value)
      + private_key_pem               = (sensitive value)
      + private_key_pem_pkcs8         = (sensitive value)
      + public_key_fingerprint_md5    = (known after apply)
      + public_key_fingerprint_sha256 = (known after apply)
      + public_key_openssh            = (known after apply)
      + public_key_pem                = (known after apply)
      + rsa_bits                      = 4096
    }

Plan: 5 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + public-ip-address = [
      + [
          + (known after apply),
          + (known after apply),
        ],
    ]
tls_private_key.rsa_4096: Creating...
tls_private_key.rsa_4096: Creation complete after 2s [id=74a0f581b3b15b41ae80fee8e688cf43e55f7fed]
local_file.private_key: Creating...
aws_key_pair.key_pair: Creating...
local_file.private_key: Creation complete after 0s [id=2a6fd9578620c7f0450138d4b0c1b07dc819fe8c]
aws_key_pair.key_pair: Creation complete after 2s [id=docker]
aws_instance.prj-vm[0]: Creating...
aws_instance.prj-vm[1]: Creating...
aws_instance.prj-vm[0]: Still creating... [10s elapsed]
aws_instance.prj-vm[1]: Still creating... [10s elapsed]
aws_instance.prj-vm[0]: Creation complete after 19s [id=i-032a6a9c18f9e1672]
aws_instance.prj-vm[1]: Still creating... [20s elapsed]
aws_instance.prj-vm[1]: Creation complete after 26s [id=i-025c9d1b961556084]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.

Outputs:

public-ip-address = [
  [
    "3.95.19.138",
    "3.94.9.203",
  ],
]
keerthi@KBB-LT:~/




![image](https://github.com/Keerthibb/Terraform-Jenkins-Ansible-Docker-CI-CD-Pipeline/assets/92278245/59a2e52d-9072-4d2c-bff3-98dfa619027c)

**Building and  Running the container for the Website Deployment:** https://github.com/Keerthibb/Website-Repo/tree/main and 



**Pulling the Docker image and copying the website hosting files to the target location:**  https://github.com/Keerthibb/Website-Repo/blob/main/Dockerfile


**Pre updating the header of the website**

![image](https://github.com/Keerthibb/Terraform-Jenkins-Ansible-Docker-CI-CD-Pipeline/assets/92278245/fab05cd8-5fcb-4e8b-8770-543cc9078566)



**Post updating the header of the website(i.e, From Restorant to My-Resturant)**

![image](https://github.com/Keerthibb/Terraform-Jenkins-Ansible-Docker-CI-CD-Pipeline/assets/92278245/c996e228-c6b8-4f9a-9e6f-b2ed72240abe)



![job-ansible-jenkins-docker-pipeline-6-console](https://github.com/Keerthibb/Terraform-Jenkins-Ansible-Docker-CI-CD-Pipeline/assets/92278245/f40ca8e5-d342-4cf6-a459-df2f8186220c)



![image](https://github.com/Keerthibb/Terraform-Jenkins-Ansible-Docker-CI-CD-Pipeline/assets/92278245/7315c861-8761-4d0b-b1d9-81337ad222d6)



**Backend Ansible code for Creating an Image, Running the container, Stopping the Container, Removing the Container, Removing the old image, and rebuilding the same** **using Git-hub webhook(Polling SCM)**
https://github.com/Keerthibb/Terraform-Jenkins-Ansible-Docker-CI-CD-Pipeline/tree/main/Ansible

