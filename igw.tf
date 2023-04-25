resource "aws_internet_gateway" "sigma_igw" {
  vpc_id = aws_vpc.sigma_vpc.id
}
