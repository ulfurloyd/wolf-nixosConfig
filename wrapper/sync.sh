#!/usr/bin/env bash

if [ "$2" != "nyx" ] && [ "$2" != "lykaon" ]; then
  echo "$2 is not a valid host! Provide either 'nyx' or 'lykaon' as host names!"
  exit 1
fi

if [ "$1" = "home" ]; then
  echo "Runnning: nh home switch -c '$2'"
  sleep 1
  nh home switch -c "$2"
  if [ "$?" -ne 0 ]; then
    echo "Command failed! Read the stack trace to fix."
  fi
  exit 0
elif [ "$1" = "system" ]; then
  echo "Running: nh os switch -H '$2'"
  sleep 1
  nh os switch -H "$2"
  if [ "$?" -ne 0 ]; then
    echo "Command failed! Read the stack trace to fix."
  fi
  exit 0
fi
