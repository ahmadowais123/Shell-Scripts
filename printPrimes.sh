#!/bin/bash

declare -i LOWER_RANGE=60000
declare -i UPPER_RANGE=63000

if [[ "$1" =~ ^[0-9]+$ ]] && [[ "$2" =~ ^[0-9]+$ ]]; then
	
	if [[ "$1" -ge "$2" ]]; then
		echo "First argument should be less than second argument"
		echo "Usage: ./printPrimes [LOWER_RANGE] [UPPER_RANGE]"
	elif [[ "$1" -eq 0 ]] || [[ "$2" -eq 0 ]]; then
		echo "Arguments have to be non-zero postive integers"
		exit 1	
	else
		LOWER_RANGE="$1"
		UPPER_RANGE="$2"
	fi
else
	echo ""$1" and "$2" are not numbers."
	echo "Usage: ./printPrimes [LOWER_RANGE] [UPPER_RANGE]"
	exit 1
fi

for(( i="$LOWER_RANGE"; i<="$UPPER_RANGE"; i++ )); do
	BOOL=0
	for(( j=2; j<"$i";j++ )); do
		let "isDivisible = "$i" % "$j""
		if [[ "$isDivisible" -eq 0 ]]; then
			BOOL=1
			break
		fi
	done
	
	if [[ "$BOOL" -eq 0 ]]  && [[ "$i" -ne 1 ]]; then
		printf "%d is a prime \n" $i
	fi
done

exit 0
