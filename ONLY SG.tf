resource "aws_security_group" "TerraformTestONLYSG" {
  name        = "TerraformTestONLYSG"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-9db1c2f4"

  ingress {
    description = "TLS from default VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}