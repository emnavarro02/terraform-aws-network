# An Elastic IP is needed for a NAT Gateway.
resource "aws_eip" "natgw_eip" {
  count = local.create_nat
}

resource "aws_nat_gateway" "natgw" {
  count         = local.create_nat
  allocation_id = aws_eip.natgw_eip.0.id
  subnet_id     = aws_subnet.sn_public_a.id

  depends_on = ["aws_internet_gateway.igw"]
}