FROM python:3.10-slim

RUN apt update && apt install vim curl wget unzip telnet tcpdump ncat openssl -y 

# jq & yq
RUN apt install jq wget -y && \
    wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq

# helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh 

# AWS CLI
#RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

# Kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && mv kubectl /usr/local/bin
    
# ArgoCD CLI
RUN curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 && \
    install -m 555 argocd-linux-amd64 /usr/local/bin/argocd && \
    rm argocd-linux-amd64

## ACT Github Actions
#RUN curl https://raw.githubusercontent.com/nektos/act/master/install.sh | bash

# Install Go
RUN apt install -y golang-go  

# Install Kustomize
RUN export KUSTOMIZE_VERSION="v5.1.1" && \
    go install sigs.k8s.io/kustomize/kustomize/v5@$KUSTOMIZE_VERSION
