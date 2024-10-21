#!/bin/bash

set -e

cd ./frontend

# Creating frontend docker image
# docker build -t frontend .

# IP address of the k3d registry (replace with the actual IP)
K3D_REGISTRY_IP="127.0.0.1"

# Hostname to map
K3D_REGISTRY_HOSTNAME="k3d-registry"

# Backup the /etc/hosts file
sudo cp /etc/hosts /etc/hosts.backup

# Check if the hostname already exists in /etc/hosts
if grep -q "$K3D_REGISTRY_HOSTNAME" /etc/hosts; then
    echo "Updating existing entry for $K3D_REGISTRY_HOSTNAME in /etc/hosts"
    sudo sed -i "/$K3D_REGISTRY_HOSTNAME/c\\$K3D_REGISTRY_IP $K3D_REGISTRY_HOSTNAME" /etc/hosts
else
    echo "Adding $K3D_REGISTRY_HOSTNAME to /etc/hosts"
    echo "$K3D_REGISTRY_IP $K3D_REGISTRY_HOSTNAME" | sudo tee -a /etc/hosts > /dev/null
fi

# Display the updated /etc/hosts
echo "Updated /etc/hosts:"