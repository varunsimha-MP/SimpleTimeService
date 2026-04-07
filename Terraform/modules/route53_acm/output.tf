output "certificate_arn" {
  value = aws_acm_certificate_validation.ssl_valid.certificate_arn
}