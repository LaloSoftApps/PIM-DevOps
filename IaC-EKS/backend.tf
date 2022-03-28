# Configure Backend to S3
terraform {
  backend "s3" {
    bucket = "mundose-s3-tfstate"
    key    = "IaC/states/ProyInt"
    region = "us-east-2"  
  }
}
