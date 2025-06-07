Provisioned AWS infra using Terraform for **Continuous integration and continuous deployment (CI/CD)** using a powerful combination of Jenkins, Ansible, Docker, and GitHub Webhooks, all running on the Amazon Web Services (AWS) cloud platform.

# To run this project on your side
### expectations
- terraform configured
- github configured
- AWS configured


### Step 1
```terraform init```

### Step 2
```Terraform plan```
<-- if you want to see what will be provisioned on AWS

### Step 3
```terraform apply```
*be sure to type yes when prompted*

### When done and want to remove the provisioned infrastructure
```terraform destroy```

credit:
**originally forked from:** https://github.com/Keerthibb/Terraform-Jenkins-Ansible-Docker-CI-CD-Pipeline