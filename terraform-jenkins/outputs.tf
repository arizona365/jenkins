output "instance_ip_addr" {
  value = aws_instance.web.public_ip
}
output "arn" {
  value = aws_instance.web.arn
}

output "jenkins_website" {
  value = "${aws_route53_record.jenkins.name}:8080"
}



