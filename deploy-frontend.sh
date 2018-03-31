#!/bin/bash

cd ../transcriba-web


echo "Checkout desired deployment branch";
git checkout 2.0
git pull

echo "Build bundled application";
npm install
ng build --environment prod

echo "Restart Webserver";
pm2 startOrRestart ../transcriba-deployment/serve-transcriba-web-beta.sh --name trWebBeta
