#!/usr/bin/env bash

nix-shell -p python311Packages.dbus-python --run "python /home/wolf/.dotfiles/home/scripts/spotify_status.py"
