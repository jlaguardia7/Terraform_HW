## Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "sigma_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "sigma_vpc_public_subnet_a" {
  vpc_id = aws_vpc.sigma_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "SigmaVpcPublicSubnet1a"
  }
}

resource "aws_subnet" "sigma_vpc_public_subnet_b" {
  vpc_id = aws_vpc.sigma_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "SigmaVpcPublicSubnet1b"
  }
}

resource "aws_subnet" "sigma_vpc_private_subnet_a" {
  vpc_id = aws_vpc.sigma_vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "SigmaVpcPrivateSubnet1a"
  }
}

resource "aws_subnet" "sigma_vpc_private_subnet_b" {
  vpc_id = aws_vpc.sigma_vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "SigmaVpcPrivateSubnet1b"
  }
}

resource "aws_route_table" "sigma_vpc_public_route_table" {
  vpc_id = aws_vpc.sigma_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sigma_igw.id
  }
}

resource "aws_route_table" "sigma_vpc_private_route_table" {
  vpc_id = aws_vpc.sigma_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.sigma_nat.id
  }
}

resource "aws_internet_gateway" "sigma_igw" {
  vpc_id = aws_vpc.sigma_vpc.id
}

resource "aws_nat_gateway" "sigma_nat" {
  allocation_id = aws_eip.sigma_eip.id
  vpc_id = aws_vpc.sigma_vpc.id
  subnet_id = aws_subnet.sigma_vpc_public_subnet_a.id
}

resource "aws_eip" "sigma_eip" {
  vpc = true
}
