terraform {
  backend "s3" {
    region = "ap-southeast-1"
    key = "terraform.state"
    bucket = "dev-environment-terrform"
    encrypt = true
    use_lockfile = true
  }
}