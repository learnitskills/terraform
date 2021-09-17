output "private_ip_pubec2" {
  value = aws_instance.pubvm.private_ip
}

output "public_ip_pubec2" {
  value = aws_instance.pubvm.public_ip
}


output "private_ip_privateVm" {
  value = aws_instance.privvm.private_ip
}
