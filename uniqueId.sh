#!/bin/bash

echo "Generating a unique 6 digit ID for your computer..."
sleep 5s
echo $(sha1sum /etc/passwd | cut -c 1-6)

exit 0
