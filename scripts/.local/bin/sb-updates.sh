#!/usr/bin/env sh

updates=$(checkupdates | wc -l)
if [ "$updates" -eq 0 ]; then
	echo "Fully Updated"
elif [[ "$updates" == "1" ]]; then
	echo "1 new update"
else
	echo "$updates"" new updates"
fi

exit $?
