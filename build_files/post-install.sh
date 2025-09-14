#!/bin/bash

# Enable podman socket
systemctl enable podman.socket

# With that, disable docker socket to prevent accidental activation
systemctl disable docker.socket

# Disable Zincati for now
systemctl disable zincati.service

# Disable OCI migration MOTD, we are already OCI
systemctl disable coreos-oci-migration-motd.service

# Setup signing for Resna
## Copy public key
mkdir -p /etc/pki/containers
cp /ctx/cosign.pub /etc/pki/containers/resna.pub
