#!/usr/bin/env bash

while :
do
  nix-shell -p python311Packages.dbus-python --run "python /home/wolf/.dotfiles/home/common/scripts/spotify_status.py"
  sleep 1
done
