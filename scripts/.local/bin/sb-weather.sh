#!/bin/sh

curl -sf "wttr.in?format=1" | tr -d "+" | awk 'NF{ print $NF }'
