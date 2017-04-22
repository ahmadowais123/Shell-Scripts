#!/bin/bash
SELF=$0
LIST=$(ls)

if [[ ! -d "Backup" ]]; then
	mkdir Backup
fi

while read -r fileName; do
	if [[ -f "$fileName" && $(file "$fileName" | grep "shell") ]]; then
		fileNameWithoutExt=$(echo "$fileName" | cut -d "." -f1)
		cat "$fileName" > Backup/"$fileNameWithoutExt"_backup.sh
	fi
done <<< "$LIST"
