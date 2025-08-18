FROM quay.io/argoproj/argocd:v3.0.12

USER root
RUN apt-get update && apt-get install -y wget gnupg \
 && wget https://github.com/getsops/sops/releases/download/v3.8.1/sops-v3.8.1.linux.amd64 \
 && mv sops-v3.8.1.linux.amd64 /usr/local/bin/sops \
 && chmod +x /usr/local/bin/sops \
 && chown argocd:argocd /usr/local/bin/sops \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

USER argocd
