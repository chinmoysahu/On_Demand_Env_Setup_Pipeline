resource "aws_s3_bucket" "my_bucket" {
  bucket = terraform-backend-ondmd
  acl    = "private"
  #region = var.region_val
  tags = {
    Name        = "terraform-backend-ondmd"
    Environment = terraform.workspace
  }

}
