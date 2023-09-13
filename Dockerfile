FROM --platform=linux/arm64 ubuntu

RUN apt update && \
    apt install jq wget -y && \
    wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq
