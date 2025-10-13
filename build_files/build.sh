#!/bin/bash

set -ouex pipefail

### Install packages

# Install dnf plugins
dnf -y install dnf5-plugins

# Apparently ZSTD is not included by default
dnf5 -y install zstd

# Damillora's Atelier Damillora uses Tailscale for connectivity
dnf5 -y config-manager addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
dnf5 -y install tailscale

# CoreOS + Ansible is how Atelier Damillora is deployed
# Ansible requires Python to be installed
dnf5 -y install python3

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

# Tweak os-release
sed -i '/^PRETTY_NAME/s/"$/-resna (Resna Core)"/' /usr/lib/os-release
sed -i '/^VERSION/s/ (CoreOS)"$/-resna (Resna Core)"/' /usr/lib/os-release
sed -i 's|^VARIANT_ID=.*|VARIANT_ID=damillora-resna|' /usr/lib/os-release
sed -i 's|^VARIANT=.*|VARIANT="Resna Core"|' /usr/lib/os-release
sed -i "/^OSTREE_VERSION/s/'$/-resna'/" /usr/lib/os-release
