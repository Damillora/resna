#!/bin/bash
# Enable podman socket
systemctl enable podman.socket

# Disable Zincati for now
systemctl disable zincati.service

