#!/bin/bash

if [[ "$#" -ne 1 ]]; then
	echo "Usage: ./removeSpacing.sh [FILE]"
	exit 0
fi

if [[ ! -f "$1" ]]; then
	echo "No such file exits $1"
	exit 0
fi

FILE=$(cat "$1")

while read -r line; do
	if [[ -n "$line"  ]]; then
		echo "$line"
	fi
done <<< "$FILE"
