#!/usr/bin/env bash

echo "Checking service"
running=$(ps aux | grep 'example.service.sh' | grep -v grep)
if [ -z "${running}" ]; then 
    exit 2
fi
