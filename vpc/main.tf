provider "aws" {
  region = "us-east-1"
  profile = var.profile
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr_range
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    "Name" = "terragrunt-vpc"
  }
}
resource "aws_internet_gateway" "IGW" {
   vpc_id = aws_vpc.main.id
}