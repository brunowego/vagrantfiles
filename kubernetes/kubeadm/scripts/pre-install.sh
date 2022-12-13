#! /bin/sh
set -e

# Disable Security-Enhanced (SE) Linux
setenforce 0
sed -i '/^SELINUX=/s/enforcing/permissive/' /etc/selinux/config

# iptables
cat << EOF | tee /etc/sysctl.d/90-bridge.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sysctl --system

# SWAP
swapoff -a
sed -i '/ swap /s/^\(.*\)$/# \1/g' /etc/fstab
