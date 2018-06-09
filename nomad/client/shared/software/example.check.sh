#!/usr/bin/env bash

running=$(ps aux | grep 'python.service.py' | grep -v grep)
if [ -z "${running}" ]; then
    echo "Service is not running"
    echo "$running"
    exit 2
fi
echo "Service is running:"
echo "$running"

