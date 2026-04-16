variable "tenancy_ocid" {
  type        = string
  description = "OCI tenancy OCID"
}

variable "user_ocid" {
  type        = string
  description = "IAM user OCID"
}

variable "fingerprint" {
  type        = string
  description = "API key fingerprint"
}

variable "private_key_path" {
  type        = string
  default     = "~/.oci/oci_api_key.pem"
  description = "Path to the OCI API private key file"
}

variable "region" {
  type        = string
  default     = "us-ashburn-1"
  description = "OCI region"
}

variable "compartment_id" {
  type        = string
  description = "OCI compartment OCID for all resources"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key content for instance access"
}

variable "instance_ocpus" {
  type        = number
  default     = 4
  description = "Number of OCPUs for the A1.Flex instance (free tier max: 4)"
}

variable "instance_memory_gb" {
  type        = number
  default     = 24
  description = "RAM in GB for the A1.Flex instance (free tier max: 24)"
}

variable "boot_volume_size_gb" {
  type        = number
  default     = 100
  description = "Boot volume size in GB (covers OS + Ollama + model + headroom)"
}

variable "instance_name" {
  type        = string
  default     = "qwen3-inference"
  description = "Display name for the compute instance"
}

variable "base_model" {
  type        = string
  default     = "qwen3:0.6b"
  description = "Ollama base model tag to pull (e.g. qwen3:0.6b, qwen3:8b)"
}

variable "model_alias" {
  type        = string
  default     = "qwen3-custom"
  description = "Ollama model name for the baked custom model (base + prompts)"
}

variable "system_prompt" {
  type        = string
  description = "Security rules and behavioral constraints baked into the model via Modelfile SYSTEM directive"
}

variable "context_prompt" {
  type        = string
  description = "Domain/background context pre-seeded into the model as conversation history"
}

variable "captcha_secret" {
  type        = string
  description = "HMAC secret for captcha cookie signing — must be a strong random string"
}
