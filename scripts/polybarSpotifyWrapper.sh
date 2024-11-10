#!/usr/bin/env bash

nix develop /home/wolf/.dotfiles --override-input nixpkgs github:NixOS/nixpkgs --command python /home/wolf/.dotfiles/scripts/spotify_status.py
