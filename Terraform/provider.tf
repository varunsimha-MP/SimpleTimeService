provider "aws" {
    region = var.app_region
    assume_role {
      role_arn = "arn:aws:iam::590183945701:role/terraform-to-github-oidc"
      session_name = "terraform"
    }
}
