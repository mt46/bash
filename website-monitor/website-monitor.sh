#!/bin/bash
# Monitor a website for unauthorized changes

_REF_CHECKSUM=e3eb0a1df437f3f97a64aca5952c8ea1
_WEBSITE=$1

function show_usage {
    echo "usage: $0 <Website URL - https://www.google.com>"
}

function check_checksum {
    RESULT=$(curl -s $_WEBSITE | md5sum | awk '{print $1}')

    if [ "$RESULT" != "$_REF_CHECKSUM" ]
    then
        echo "ALARM: Review the website"
    else
        echo "All good!"
    fi
}

if [ $# -ne 1 ]
then
    show_usage
    exit 1
else
    check_checksum
fi