resource "aws_s3_bucket" "my_bucket" {
  bucket = var.my_app_s3_bucket
  acl    = "private"
  #region = var.region_val
  tags = {
    Name        = "K8s-key-store-cks"
    Environment = terraform.workspace
  }

}
