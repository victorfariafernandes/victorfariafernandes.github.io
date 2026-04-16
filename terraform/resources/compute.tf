locals {
  nginx_conf_b64 = base64encode(
    templatefile("${path.module}/../templates/nginx/nginx.conf.tpl", {
      captcha_secret = var.captcha_secret
    })
  )
  docker_compose_b64   = base64encode(file("${path.module}/../templates/docker-compose.yml"))
  nginx_dockerfile_b64 = base64encode(file("${path.module}/../templates/nginx/Dockerfile"))
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancy_ocid
}

resource "oci_core_instance" "qwen3" {
  compartment_id      = var.compartment_id
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  display_name        = var.instance_name
  shape               = "VM.Standard.A1.Flex"

  shape_config {
    ocpus         = var.instance_ocpus
    memory_in_gbs = var.instance_memory_gb
  }

  source_details {
    source_type             = "image"
    source_id               = var.ubuntu_image_id
    boot_volume_size_in_gbs = var.boot_volume_size_gb
  }

  create_vnic_details {
    subnet_id        = oci_core_subnet.public.id
    assign_public_ip = true
    display_name     = "${var.instance_name}-vnic"
  }

  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = base64encode(templatefile("${path.module}/../templates/cloud-init.yaml.tpl", {
      system_prompt        = var.system_prompt
      context_prompt       = var.context_prompt
      base_model           = var.base_model
      model_alias          = var.model_alias
      nginx_conf_b64       = local.nginx_conf_b64
      docker_compose_b64   = local.docker_compose_b64
      nginx_dockerfile_b64 = local.nginx_dockerfile_b64
    }))
  }
}
