#!/bin/bash

DIRNAME=/usr/bin
FILETYPE="shell script"
LOGFILE=logfile

file ~/Desktop/Scripting/* | grep "$FILETYPE" | tee $logfile | wc -l

exit 0
