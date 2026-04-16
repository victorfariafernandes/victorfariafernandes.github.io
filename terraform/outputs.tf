output "public_ip" {
  description = "Public IP address of the inference instance"
  value       = module.infrastructure.public_ip
}

output "instance_ocid" {
  description = "OCID of the compute instance"
  value       = module.infrastructure.instance_ocid
}

output "ssh_command" {
  description = "SSH command to connect to the instance"
  value       = "ssh ubuntu@${module.infrastructure.public_ip}"
}

output "ollama_api" {
  description = "Base URL for the Ollama REST API"
  value       = "http://${module.infrastructure.public_ip}:11434"
}

output "custom_model_name" {
  description = "Ollama model name with prompts baked in"
  value       = var.model_alias
}
