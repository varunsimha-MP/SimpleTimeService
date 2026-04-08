output "certificate_arn" {
  value = aws_acm_certificate_validation.ssl_valid.certificate_arn
}

output "zone_id" {
  value       = aws_route53_zone.dns.zone_id
}