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
