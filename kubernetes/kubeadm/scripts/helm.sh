#! /bin/sh
set -e

curl -H 'Cache-Control: no-cache' -Ss https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash

kubectl create serviceaccount tiller -n kube-system

kubectl create clusterrolebinding tiller-cluster-rule \
  --clusterrole=cluster-admin \
  --serviceaccount=kube-system:tiller

helm init --service-account tiller
