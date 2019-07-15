# /bin/bash

kubectl wait --for=condition=available deployments/kubox &> /dev/null

KUBOX_POD=$(kubectl get pods -o jsonpath="{range .items[*]}{.metadata.name}{'\n'}" | grep kubox)

kubectl cp ~/.ssh/id_rsa.pub $KUBOX_POD:/home/kubox/.ssh/authorized_keys

exec kubectl exec -it $KUBOX_POD -- zsh
