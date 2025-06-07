resource "aws_vpc" "Terraform_VPC" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "Prj_VPC"
  }
}

resource "aws_subnet" "prj-public_subnet" {
    cidr_block = var.public_cidr
    vpc_id = aws_vpc.Terraform_VPC.id
    map_public_ip_on_launch = true
    availability_zone = var.availability_zone
    tags = {
        Name = "Prj-public-Subnet"
    }
}

resource "aws_internet_gateway" "prj-internet-gateway" {
    vpc_id = aws_vpc.Terraform_VPC.id
    tags = {
        Name = "Prj-IGW"
    }
}

resource "aws_route_table" "prj-route_table" {
    vpc_id = aws_vpc.Terraform_VPC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.prj-internet-gateway.id
    }
    tags = {
            Name = "Prj-Route-table"
        }
}

resource "aws_route_table_association" "prj-route-table-association" {
    subnet_id = aws_subnet.prj-public_subnet.id
    route_table_id = aws_route_table.prj-route_table.id
}

resource "aws_security_group" "prj-security-group" {
    name = "web"
    vpc_id = aws_vpc.Terraform_VPC.id

   ingress {
    description = "This is inbound security policy for HTTP Protocol"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ingress {
    description = "This is inbound security policy for SSH Port"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow 8080 port to access jenkins"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
  }

  egress {
    description = "Allow outgoing request"
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Prj-security-group"
  }
}
