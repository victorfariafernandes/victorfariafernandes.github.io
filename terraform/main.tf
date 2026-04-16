terraform {
  required_providers {
    oci = { source = "oracle/oci", version = "~> 6.0" }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

# Resolve latest Ubuntu 22.04 ARM64 platform image dynamically
data "oci_core_images" "ubuntu_arm" {
  compartment_id           = var.compartment_id
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "22.04"
  shape                    = "VM.Standard.A1.Flex"
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

locals {
  ubuntu_image_id = data.oci_core_images.ubuntu_arm.images[0].id
}

module "infrastructure" {
  source = "./resources"

  compartment_id      = var.compartment_id
  tenancy_ocid        = var.tenancy_ocid
  ubuntu_image_id     = local.ubuntu_image_id
  ssh_public_key      = var.ssh_public_key
  instance_name       = var.instance_name
  instance_ocpus      = var.instance_ocpus
  instance_memory_gb  = var.instance_memory_gb
  boot_volume_size_gb = var.boot_volume_size_gb
  base_model          = var.base_model
  model_alias         = var.model_alias
  system_prompt       = var.system_prompt
  context_prompt      = var.context_prompt
  captcha_secret      = var.captcha_secret
}
