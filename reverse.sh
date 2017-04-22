#!/bin/bash

FILE=$(cat "$0")

reverse() {	
	local STRING="$1"
	local REVERSE_STRING=""
	local LENGTH=${#STRING}
	
	for((i="$LENGTH"; i>0; i--)); do
		REVERSE_STRING="$REVERSE_STRING"$(echo "$STRING" | cut -c "$i")
	done

	echo "$REVERSE_STRING"
}

while read -r LINE; do
	STRING=$(reverse "$LINE")
	echo "$STRING"
done <<< "$FILE"
