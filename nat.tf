resource "aws_nat_gateway" "sigma_nat" {
  allocation_id = aws_eip.sigma_eip.id
  vpc_id = aws_vpc.sigma_vpc.id
  subnet_id = aws_subnet.sigma_vpc_public_subnet_a.id
}
