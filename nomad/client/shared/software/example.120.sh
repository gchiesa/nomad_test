#!/usr/bin/env bash 

echo "Starting a 120 seconds job"
echo "Printing env"
env | sort
sleep 120
echo "Done"
exit 0
