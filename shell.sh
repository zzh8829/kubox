# /bin/bash

kubectl wait --for=condition=available deployments/kubox &> /dev/null

exec kubectl exec -it $(kubectl get pods -o jsonpath="{range .items[*]}{.metadata.name}{'\n'}" | grep kubox) -- zsh
