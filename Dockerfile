FROM golang:1.15-buster

RUN mkdir /app

RUN wget https://github.com/digitalocean/doctl/releases/download/v1.57.0/doctl-1.57.0-linux-amd64.tar.gz
RUN tar xf doctl-1.57.0-linux-amd64.tar.gz && rm *tar.gz
RUN mv doctl /app

RUN wget https://github.com/cli/cli/releases/download/v1.9.1/gh_1.9.1_linux_amd64.deb
RUN dpkg -i gh_1.9.1_linux_amd64.deb && rm *.deb
RUN gh config set prompt enabled 
