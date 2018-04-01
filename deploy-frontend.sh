#!/bin/bash

cd ../transcriba-web

function echoHeading {
  echo " "
  echo "#################################";
  echo "$1";
  echo "#################################";
  echo " "
}


echoHeading "Checkout desired deployment branch";
git checkout 2.0
git pull

echoHeading "Build bundled application";
npm install
ng build --prod --build-optimizer

echoHeading "Restart Webserver";
pm2 delete trWebBeta
pm2 start ../transcriba-deployment/serve-transcriba-web-beta.sh --name trWebBeta
