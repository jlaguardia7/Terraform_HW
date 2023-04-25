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
