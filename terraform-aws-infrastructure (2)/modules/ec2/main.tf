resource "aws_iam_role" "ec2_role" {
  name = "${var.env}-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_instance_profile" "profile" {
  name = "${var.env}-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_instance" "app" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet
  iam_instance_profile   = aws_iam_instance_profile.profile.name

  user_data = <<EOF
#!/bin/bash
echo "Hello from Terraform" > /home/ec2-user/hello.txt
EOF

  tags = {
    Name        = "${var.env}-app-instance"
    Environment = var.env
  }
}