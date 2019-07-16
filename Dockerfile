FROM ubuntu:18.04

RUN apt-get update && apt-get install -yqq \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    git \
    zsh \
    sudo \
    build-essential \
    wget \
    rsync \
    openssh-server \
    mosh \
    locales \
    htop \
    tmux

# Locale
RUN locale-gen en_US.UTF-8

# SSH Mosh
RUN sed -r -i 's/^#Port .*/Port 50022/g' /etc/ssh/sshd_config
RUN sed -r -i 's/^#PermitRootLogin .*/PermitRootLogin no/g' /etc/ssh/sshd_config
RUN sed -r -i 's/^#PasswordAuthentication .*/PasswordAuthentication no/g' /etc/ssh/sshd_config

# Neovim
RUN add-apt-repository -y ppa:neovim-ppa/stable
RUN apt-get update && apt-get install -yyq neovim

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
# RUN usermod -a -G sudo kubox
RUN echo "kubox ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER kubox
WORKDIR /home/kubox

COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "zsh" ]
