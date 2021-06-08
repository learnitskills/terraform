# EIP Output

output "elastic_IP_public_ip_is" {
  value = aws_eip.elip.public_ip
}

output "elastic_IP_id_is" {
  value = aws_eip.elip.id
}


# Bucket Output


output "Bucket_domain_name_is" {
  value = aws_s3_bucket.buck.bucket_domain_name
}


output "Bucket_id_is" {
  value = aws_s3_bucket.buck.id
}