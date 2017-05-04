#!/bin/bash

kubectl get secret hookmanager-cred &> /dev/null
exists=$(echo $?)
if [ $exists -eq 0 ]; then
  echo "Auth token secret already defined for this cluster.  Please remove via ./delete_auth_k8s.sh before recreating.";
  exit 1;
fi

set -e

BOT_USER_ID=samsungbot

#first create an auth token
CONTAINER_ID=`docker run -d jfelten/hook_manager tail -f /dev/null`
docker exec -it $CONTAINER_ID /hook_manager create_authorization --account=${BOT_USER_ID} --note="${BOT_USER_ID} - generated by hook manager"
eval $(docker exec -it $CONTAINER_ID cat ./github_cred)
docker kill $CONTAINER_ID

# Store as kubernetes secret
cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Secret
metadata:
  name: hookmanager-cred
type: Opaque
data:
  user_id: $(echo "$BOT_USER_ID" | tr -d '\n\r' | base64)
  auth_id: $(echo "$GITHUB_AUTH_ID" | tr -d '\n\r' | base64)
  auth_token: $(echo "$GITHUB_AUTH_TOKEN" | tr -d '\n\r' | base64)
  oauth: $(echo "$GITHUB_AUTH_TOKEN" | tr -d '\n\r' | base64)
EOF
