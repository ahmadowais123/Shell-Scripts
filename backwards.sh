#!/bin/bash

FILE=$(cat "$0")
LENGTH=$(echo "$FILE" | wc -l)

for((i="$LENGTH"; i>0; i--)); do
	echo "$FILE" | sed ""$i"q;d"
done

exit 
