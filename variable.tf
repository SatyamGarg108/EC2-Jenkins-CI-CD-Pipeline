variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/26"
}

variable "public_cidr" {
    type = string
    default = "10.0.0.0/28"
}

variable "availability_zone" {
  type = string 
  default = "us-east-1a"
}

variable "region_value" {
  description = "value for the region"
  default = "us-east-1"
}

variable "ami_value" {
  description = "value for the ami"
  default = "ami-0c02fb55956c7d316"
}

variable "instance_type" {
    description = "value for the instance type"
    default = "t2.medium"
}

variable "ec2_instance_count" {
  description = "value for the ami"
  default = 1
}

variable "security_group_value" {
  description = "value for the security group"
  default = "sg-0654c33bc324a31fd"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default = "docker.pem"
}