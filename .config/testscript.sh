#!/bin/bash 

if ! ping -q -c1 8.8.8.8 &>/dev/null; then

echo "not connected"
else
echo "connected"
fi