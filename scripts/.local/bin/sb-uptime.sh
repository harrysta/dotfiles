#!/bin/sh 
uptime -p | sed -r -e 's/up //g' -e 's/ days?/d/g' -e 's/ hours?/h/g' -e 's/ minutes?/m/g' -e 's/, / /g'
exit $?
