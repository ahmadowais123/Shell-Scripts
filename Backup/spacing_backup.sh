#!/bin/bash

if [[ "$#" -ne 2 ]]; then
	echo "Usage: ./spacing.sh [FILE] [SPACING]"
	exit 0
fi

if [[ ! -f "$1" ]]; then
	echo "No such file exists $1"
	exit 0
fi

FILE=$(cat "$1")
SPACING=$2

while read -r LINE; do
	echo -e "$LINE"
	for((i=0; i<"$SPACING"; i++)); do
		echo
	done
done <<< "$FILE"
