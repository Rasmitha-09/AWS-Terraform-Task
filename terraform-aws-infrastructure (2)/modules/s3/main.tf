resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "logs" {
  bucket = "${var.env}-app-logs-${random_id.suffix.hex}"

  tags = {
    Name        = "${var.env}-logs"
    Environment = var.env
  }
}