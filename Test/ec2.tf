resource "aws_instance" "terraformtest" {
  ami           = "ami-0e38b48473ea57778"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.TerraformTestSG.name}"]
  tags = {
    Name = "terraformtest"
  }
}


resource "aws_security_group" "TerraformTestSG" {
  name        = "TerraformTestSG"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-9db1c2f4"

  ingress {
    description = "TLS from default VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}