#!/bin/bash

if [[ "$#" -ne 2 ]]; then
	echo "Usage: ./checkIfRunning.sh [PID] [TIME_DELAY]"
	exit 1
fi

PID=$1
TIME_DELAY=$2

while true; do
	isRunning=$(ps -e | grep "$PID")
	if [[ -n "$isRunning" ]]; then
		echo "Process with PID "$PID" is running"
		sleep "$TIME_DELAY"s
	else
		echo "Process with PID "$PID" has stopped/finished"
		exit 0
	fi
done

exit
