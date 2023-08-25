FROM python:3.10-slim

RUN apt update && \
    apt install yq jq -y