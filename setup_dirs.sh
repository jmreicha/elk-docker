#!/bin/bash

set -e

# Create data dir
if [ ! -d /data ] ; then
    echo "Creating /data directory"
    mkdir -p /data
else
    echo "Directory already exists!"
fi
