# Kubox

On-demand dev box on kubernetes cluster

Dev boxes should be containerized and cloud native too.

Supports 3 modes of connection
- kubectl exec (tunnel through http works anywhere)
- ssh (port 50022, better performance, needs ssh connection)
- mosh (port 50023, best performance, needs UDP connection)

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
./shell # kubectl exec

# copy ssh key
kubectl cp ~/.ssh/id_rsa.pub $KUBOX_POD:/home/kubox/.ssh/authorized_keys
./shell mosh # mosh
./shell ssh # ssh
```

## Downside

- Docker run works but mounting directory is difficult
- Docker build depends on host docker version


## Other steps

```
# copy ssh key


# gen ssh key
ssh-keygen -N "" -C kubox
```
