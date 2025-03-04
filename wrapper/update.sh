#!/usr/bin/env bash

SCRIPT_DIR=~/.dotfiles

echo "Updating nix flake inputs!"
sleep 1

# Update flake
pushd $SCRIPT_DIR &> /dev/null || exit
nix flake update
popd &> /dev/null || exit
