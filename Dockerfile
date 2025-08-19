FROM quay.io/argoproj/argocd:v3.0.12

USER root

# Install SOPS
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget https://github.com/getsops/sops/releases/download/v3.8.1/sops-v3.8.1.linux.amd64 && \
    mv sops-v3.8.1.linux.amd64 /usr/local/bin/sops && \
    chmod +x /usr/local/bin/sops && \
    apt-get clean && rm -rf /var/lib/apt/lists/*


# Use numeric UID of argocd user instead of username
USER 999:999
