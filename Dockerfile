FROM ubuntu:18.04

RUN apt-get update && apt-get install -yqq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    git \
    zsh

# Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
RUN apt-get update && apt-get install -yqq \
    docker-ce-cli

# New User
RUN useradd --create-home --shell /bin/zsh kubox
USER kubox
WORKDIR /home/kubox

COPY kubox-init.sh /

CMD [ "zsh" ]