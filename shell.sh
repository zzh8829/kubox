# /bin/bash

kubectl wait --for=condition=available deployments/kubox &> /dev/null

KUBOX_POD=$(kubectl get pods -o jsonpath="{range .items[*]}{.metadata.name}{'\n'}" | grep kubox)

if type mosh &> /dev/null; then
    KUBOX_NODE=$(kubectl get pods $KUBOX_POD -o jsonpath="{.spec.nodeName}")
    KUBOX_IP=$(kubectl get node $KUBOX_NODE -o json | grep ExternalIP -B 1 | grep -E -o "[0-9\.]+")
    exec mosh --ssh="ssh -p 50022" -p 50023 kubox@$KUBOX_IP
fi

exec kubectl exec -it $KUBOX_POD -- zsh
