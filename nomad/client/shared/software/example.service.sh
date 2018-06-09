#!/usr/bin/env bash

echo "Example service with infinite loop"
while true; do date; sleep 10; done
echo "Exiting"
exit 0
