#! /bin/sh
set -e

kubeadm config images pull -v 4

kubeadm join 10.101.1.2:6443 \
  --token 9fr5pz.z5zohdu4n88n04xx \
  --discovery-token-ca-cert-hash sha256:daabd37fa282d5166417b6e91e727bd35163ee069ef36e0ec20df9394ef67b6a
