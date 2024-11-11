#!/usr/bin/env bash

nix-shell -p python311Packages.dbus-python --run "python /home/wolf/.dotfiles/scripts/spotify_status.py"
