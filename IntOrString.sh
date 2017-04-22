#!/bin/bash


if [[ "$#" -eq 0 ]]; then
	echo "No arguments provided"
	echo "Usage: ./IntOrString [ARG1] [ARG2] ..."
	exit 1
fi

for i in "$@"; do
	if [[ "$i" =~ ^[0-9]+$ ]]; then
		echo ""$i" is an Integer"
	else
		echo ""$i" is a String"
	fi
done

exit 0
