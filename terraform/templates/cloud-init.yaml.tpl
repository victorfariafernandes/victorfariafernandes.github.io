#cloud-config
package_update: true
package_upgrade: false

packages:
  - curl
  - ca-certificates

write_files:
  - path: /opt/llm/Modelfile
    permissions: '0644'
    content: |
      FROM ${base_model}

      SYSTEM """
      ${system_prompt}
      """

      MESSAGE user "Please acknowledge and retain the following context for our conversation: ${context_prompt}"
      MESSAGE assistant "Understood. I have read and will retain the provided context throughout our conversation."

  - path: /opt/llm/docker-compose.yml
    encoding: b64
    permissions: '0644'
    content: ${docker_compose_b64}

  - path: /opt/llm/nginx/Dockerfile
    encoding: b64
    permissions: '0644'
    content: ${nginx_dockerfile_b64}

  - path: /opt/llm/nginx/nginx.conf
    encoding: b64
    permissions: '0644'
    content: ${nginx_conf_b64}

runcmd:
  # Install Docker Engine
  - curl -fsSL https://get.docker.com | sh
  - systemctl enable docker
  - systemctl start docker

  # Open port 80 at OS level (OCI security list handles external ingress,
  # but iptables may block before cloud-init completes)
  - iptables -I INPUT -p tcp --dport 80 -j ACCEPT

  # Build nginx image and start both containers
  - cd /opt/llm && docker compose up -d --build

  # Wait for Ollama to be ready, then pull model and bake custom model with prompts
  - sleep 30
  - docker exec ollama ollama pull ${base_model}
  - docker exec ollama ollama create ${model_alias} -f /Modelfile
