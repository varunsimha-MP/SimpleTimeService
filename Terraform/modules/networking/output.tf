output "core_network" {
  value = aws_vpc.core_network.id
}

output "pri_subnet" {
  value = aws_subnet.pri_subnet[*].id
}

output "pub_subnet" {
  value = aws_subnet.pub_subnet[*].id
}