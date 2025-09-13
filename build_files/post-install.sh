#!/bin/bash
# Enable podman socket
systemctl enable podman.socket

# Disable Zincati for now
systemctl disable zincati.service

# Disable OCI migration MOTD, we are already OCI
systemctl disable coreos-oci-migration-motd.service
