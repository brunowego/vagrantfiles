#! /bin/sh
set -e

kubeadm config images pull -v 4

kubeadm init \
  --apiserver-advertise-address "$(hostname -I | awk '{print $2}')" \
  --pod-network-cidr=10.244.0.0/16

mkdir -p "$HOME"/.kube
sudo cp -i /etc/kubernetes/admin.conf "$HOME"/.kube/config
sudo chown vagrant: "$HOME"/.kube/config

kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/canal.yaml
