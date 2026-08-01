resource "aws_eip" "this" {
  count = var.allocate_elastic_ip ? 1 : 0

  domain = "vpc"

  tags = {
    Name = "cloud-platform-${var.environment}-eip"
    Environment = var.environment
    Project = "cloud-platform"
  }
}


resource "aws_eip_association" "this" {
  count = var.allocate_elastic_ip ? 1 : 0

  allocation_id = aws_eip.this[0].id
  instance_id   = aws_instance.main.id
}
