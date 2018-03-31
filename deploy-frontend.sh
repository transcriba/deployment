#!/bin/bash

cd ../transcriba-web

#
# Checkout desired deployment branch
# 

git checkout 2.0
git pull

#
# Build bundled application
#

npm install
ng build --environment prod

#
# Restart Webserver
#

pm2 stop trWebBeta
pm2 start ./serve-transcriba-web-beta.sh --name trWebBeta
