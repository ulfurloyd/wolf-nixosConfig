#!/usr/bin/env bash

nix-shell -p python311Packages.dbus-python --run "python /home/wolf/.dotfiles/scripts/spotify_status.py"

# nix develop /home/wolf/.dotfiles --override-input nixpkgs github:NixOS/nixpkgs --command python /home/wolf/.dotfiles/scripts/spotify_status.py
