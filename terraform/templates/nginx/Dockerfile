FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y curl gnupg2 ca-certificates fonts-dejavu-core && \
    curl -fsSL https://extras.getpagespeed.com/release/ubuntu/gpg \
      | gpg --dearmor -o /usr/share/keyrings/getpagespeed.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/getpagespeed.gpg] \
      https://extras.getpagespeed.com/release/ubuntu jammy main" \
      > /etc/apt/sources.list.d/getpagespeed.list && \
    apt-get update && \
    apt-get install -y nginx nginx-module-captcha && \
    rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
