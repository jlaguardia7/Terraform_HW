resource "aws_route_table_association" "sigma_vpc_public_route_table_association" {
  route_table_id = aws_route_table.sigma_vpc_public_route_table.id
  subnet_id = aws_subnet.sigma_vpc_public_subnet_a.id
}

resource "aws_route_table_association" "sigma_vpc_private_route_table_association" {
  route_table_id = aws_route_table.sigma_vpc_private_route_table.id
  subnet_id = aws_subnet.sigma_vpc_private_subnet_a.id
}
