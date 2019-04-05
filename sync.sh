#!/bin/bash

echo "sync..."
rm -rf ~/.hammerspoon
mkdir -p ~/.hammerspoon
cp -r ./* ~/.hammerspoon

echo "done..."