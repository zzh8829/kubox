# Kubox

On-demand dev box on kubernetes cluster

Dev boxes should be containerized and cloud native too.

## Downside

- Docker run works but mounting directory is difficult
- Docker build depends on host docker version

## Build docker images with kaniko


```bash
docker run \
  -v $(pwd):/workspace \
  -v ~/.docker/config.json:/kaniko/.docker/config.json \
  gcr.io/kaniko-project/executor:latest \
  --dockerfile=Dockerfile \
  --context=/workspace \
  --destination=zihao/play:external-dns
```
