# /bin/bash

exec kubectl exec -it $(kubectl get pods -o jsonpath="{range .items[*]}{.metadata.name}{'\n'}" | grep kubox) -- /bin/bash
