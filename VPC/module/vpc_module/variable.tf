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