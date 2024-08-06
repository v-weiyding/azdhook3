#!/bin/bash

git init samples
cd samples
git config core.sparseCheckout true
git remote add origin https://github.com/Azure/azure-sdk-for-js.git
echo "$1" >> .git/info/sparse-checkout
git fetch --depth=1 origin main
git checkout main
echo "====cloned sample files===="