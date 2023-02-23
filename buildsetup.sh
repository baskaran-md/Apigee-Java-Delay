#!/bin/bash
# -*- mode:shell-script; coding:utf-8; -*-
#
# Created: <Tue Oct  6 11:46:13 2015>
# Last Updated: <2022-January-04 16:47:08>
#

set -e 

echo
echo "Downloading JAR files and installing them into the local Maven repo."
echo

curl -s -O https://raw.githubusercontent.com/apigee/api-platform-samples/master/doc-samples/java-cookbook/lib/expressions-1.0.0.jar

 mvn install:install-file \
  -Dfile=expressions-1.0.0.jar \
  -DgroupId=com.apigee.edge \
  -DartifactId=expressions \
  -Dversion=1.0.0 \
  -Dpackaging=jar \
  -DgeneratePom=true

rm expressions-1.0.0.jar

curl -s -O https://raw.githubusercontent.com/apigee/api-platform-samples/master/doc-samples/java-cookbook/lib/message-flow-1.0.0.jar

 mvn install:install-file \
  -Dfile=message-flow-1.0.0.jar \
  -DgroupId=com.apigee.edge \
  -DartifactId=message-flow \
  -Dversion=1.0.0 \
  -Dpackaging=jar \
  -DgeneratePom=true

rm message-flow-1.0.0.jar

echo
echo "Building the repo"
echo

cd callout && mvn clean install && cd ..

echo 
echo "Creating ZIP archive for apiproxy"
echo

cd bundle && rm -f apiproxy.zip && zip -r apiproxy.zip apiproxy/ && cd ..

echo
echo "Done."
echo "Upload the proxy bundle @ 'bundle/apiproxy.zip' to create API proxy"
echo
