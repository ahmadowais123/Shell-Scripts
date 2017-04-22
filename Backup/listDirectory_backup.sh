#!/bin/bash

HOME_DIR=$HOME
WORKING_DIR=$PWD
LIST_DIRECTORIES=
usbLocation=
usbName=

list_directories() {
	cd "$HOME_DIR"
	LIST_DIRECTORIES=$(ls -R)
	cd "$WORKING_DIR"
}

check_usb() {
	local isPresent=$(df | grep "sd[b-z][1-9]" | wc -l)
	
	if [[ isPresent -ge 1 ]]; then
		echo "0"
	else 
		echo "1"
	fi	
}

insert_usb() {

	while [[ $(check_usb) -ne "0" ]]; do

		echo -e  "USB drive not found"
		read -p "Please insert a USB drive and press ENTER"
	done	
}

get_usb_location() {
	local line=$1
	declare -i startIndex=$(awk -v a="$(df | sed "1q;d")" -v b="Mounted" "BEGIN{print index(a,b)}")
	echo $( echo "$line" | cut -c "$startIndex"-)
	
}

get_usb_name() {
	local line=$1
	echo $( echo "$1" | cut -d " " -f1)
}

print_to_usb() {
	local -i lineNumber=$(df | grep -n "sd[b-z][1-9]" | cut -d ":" -f1)
	local line=$(df | sed ""$lineNumber"q;d")
	usbLocation=$(get_usb_location "$line")
	cd "$usbLocation";echo "$LIST_DIRECTORIES" > "Directory_List.txt"; cd "$HOME"
	local usbName=$(get_usb_name "$line")

	echo "Unmount USB drive."
	sudo umount "$usbName"
	echo "You can safely remove usb drive now."		
}

list_directories
insert_usb
print_to_usb


exit 0
