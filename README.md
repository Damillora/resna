# Resna 

> Damillora's Reusable system (for) networked appliances

A Fedora CoreOS-based [bootc](https://github.com/bootc-dev/bootc) image, serving as the base image for Atelier Damillora systems.

Since Atelier Damillora is a mixed x86 and ARM environment, Resna is built in both amd64 and arm64 variants.

## Included software

Fedora CoreOS, plus:
* `zsh`
* `zstd`
* `tailscaled`
* `python3` (for Ansible)
  
## Installation

First, [Install CoreOS](https://docs.fedoraproject.org/en-US/fedora-coreos/getting-started/). 

From the newly installed Fedora CoreOS installation, rebase to an unsigned image first, then reboot:
```sh
# AMD64 variant
sudo bootc switch ghcr.io/damillora/resna:amd64
# ARM64 variant
sudo bootc switch ghcr.io/damillora/resna:arm64
```

After rebooting, rebase to a signed image:
```sh
# AMD64 variant
sudo bootc switch --enforce-container-sigpolicy ghcr.io/damillora/resna:amd64
# ARM64 variant
sudo bootc switch --enforce-container-sigpolicy ghcr.io/damillora/resna:arm64
```

## Acknowledgements

This repo builds upon the [Universal Blue image template](https://github.com/ublue-os/image-template), with additional customization.
