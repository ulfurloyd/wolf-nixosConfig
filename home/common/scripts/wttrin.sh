#!/usr/bin/env bash

curl wttr.in/jaipur\?format=1 | awk '{print $1 $2}'
