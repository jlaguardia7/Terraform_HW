terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key = "sigma-vpc.tfstate"
    region = "us-east-1"
  }
}
