# Kubox

On-demand dev box on kubernetes cluster

Dev boxes should be containerized and cloud native too.

## Features

- Remote development anywhere
- Using existing docker on the Kubernetes host
- Home directory on Persistent volume
- Dev Environment setup using [zzh8829/dotfiles](https://github.com/zzh8829/dotfiles)
- No more one-off ad-hoc droplet/ec2/vps
- ssh port tcp:50022, mosh port udp:50023

## Usage

```bash
kubectl apply -f .
./shell.sh

# initialize the kubox env for the first time
source /kubox-init.sh
```

## Downside

- Docker run works but mounting directory is difficult
- Docker build depends on host docker version
