#!/bin/sh

DAPS='dapscoind'

clear
echo "Checking if dapscoind is running..."
if ps ax | grep -v grep | grep $DAPS> /dev/null
then
    echo "$DAPS is running, no further action required"
else
    echo "$DAPS is not running, starting it now"
	dapscoind -daemon
fi