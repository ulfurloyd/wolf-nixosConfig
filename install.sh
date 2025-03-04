#!/usr/bin/env bash

# Automated script to install my dotfiles

SCRIPT_DIR=~/.dotfiles

# Determine host type (Nyx or Lykaon)
if [ $1 = "nyx" ]; then
    HOST="nyx"
elif [ $1 = "lykaon" ]; then
    HOST="lykaon"
else
    echo "Enter either 'nyx' (desktop) or 'lykaon' (laptop)"
    exit 1
fi

# Clone the git repository
nix-shell -p git --command "git clone https://github.com/eklavyasood/nixos-config $SCRIPT_DIR"

# Generate hardware config for the target system
sudo nixos-generate-config --show-hardware-config > $SCRIPT_DIR/hosts/$HOST/hardware-configuration.nix


