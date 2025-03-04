#!/usr/bin/env bash

SCRIPT_DIR=~/.dotfiles

# Update flake
$SCRIPT_DIR/wrapper/update.sh

# Sync system
$SCRIPT_DIR/wrapper/sync.sh "$1"
