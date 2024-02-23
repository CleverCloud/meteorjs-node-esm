#!/bin/bash

if [ ! -d "${HOME}/.node_esm" ]; then
    source ./enable_esm.sh
fi

echo "Node.js version: $(node -v)"
echo "NPM version: $(npm -v)"
