FROM golang:1.15-alpine

RUN wget https://github.com/digitalocean/doctl/releases/download/v1.59.0/doctl-1.59.0-linux-amd64.tar.gz
RUN tar xf doctl-1.59.0-linux-amd64.tar.gz && rm *tar.gz
RUN mv doctl /usr/local/bin

RUN wget https://github.com/cli/cli/releases/download/v1.9.2/gh_1.9.2_linux_386.tar.gz -O ghcli.tar.gz
RUN tar -C /usr --strip-components=1 -xf ghcli.tar.gz && rm ghcli.tar.gz
RUN gh config set prompt enabled 

RUN apk add curl build-base
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.17.1

RUN wget https://get.helm.sh/helm-v3.5.4-linux-amd64.tar.gz
RUN tar -zxvf helm-v3.5.4-linux-amd64.tar.gz
RUN mv linux-amd64/helm /usr/local/bin/helm