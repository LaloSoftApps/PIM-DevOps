output "instance_public_ip" {
  description = "MundosE_EC2_Public_IP"
  value       = aws_instance.mundose_server[0].public_ip
}