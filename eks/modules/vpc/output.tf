
output "aws_public_subnet" {
  value = aws_subnet.public_cloud_subnet[*].id
}

# output "aws_public_subnet_ids" {
#   value = aws_subnet.public_cloud_subnet[*].id
# }


output "vpc_id" {
  value = aws_vpc.cloud.id
}
