#!/bin/bash

# Set environment variables
NODE_ESM_VERSION="14.21.4"
NODE_ESM_URL="https://static.meteor.com/dev-bundle-node-os/v${NODE_ESM_VERSION}/node-v${NODE_ESM_VERSION}-linux-x64.tar.gz"
DIR_NODE_ESM="${HOME}/.node_esm"

# Create target directory, download Node.js ESM tarball and extract it
mkdir -p "${DIR_NODE_ESM}"
wget -qO- "${NODE_ESM_URL}" | tar -xz -C "${DIR_NODE_ESM}"/ && mv "${DIR_NODE_ESM}"/node-v${NODE_ESM_VERSION}-linux-x64 "${DIR_NODE_ESM}"/v${NODE_ESM_VERSION}

# Add node and npm to the PATH so the commands are available
export NODE_PATH="${DIR_NODE_ESM}/v${NODE_ESM_VERSION}/lib/node_modules"
export PATH="${DIR_NODE_ESM}/v${NODE_ESM_VERSION}/bin:/usr/local/bin:/usr/host/bin:/opt/bin:/home/bas/.local/bin"

# Add these paths to the .bashrc file, so they are available after during a ssh session
echo "export NODE_PATH=${DIR_NODE_ESM}/v${NODE_ESM_VERSION}/lib/node_modules" >> "${HOME}/.bashrc"
echo "export PATH=${DIR_NODE_ESM}/v${NODE_ESM_VERSION}/bin:/usr/local/bin:/usr/host/bin:/opt/bin:/home/bas/.local/bin" >> "${HOME}/.bashrc"

echo "Node.js ESM ${NODE_ESM_VERSION} has been installed."