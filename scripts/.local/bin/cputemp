#!/bin/sh

sensors | grep -m 1 -i "cpu" | cut -d '+' -f2 | awk '{ print $1 }'
