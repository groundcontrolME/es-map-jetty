#!/bin/bash

# Usage: modify /src/index.html and any of the scripts in /src/scripts to adapt to your environment

export NAME=es-map-jetty
export SRC_DIR=${PWD}/src
export STAGING_DIR=${PWD}/jetty-app
export APP_DIR=$STAGING_DIR/webapps/map
export GITHUB_REPO=https://github.com/groundcontrolME/$NAME
export ARTIFACT_FILENAME=$NAME.zip
export MARATHON_APP_FILENAME=$NAME.json
export DATE=`date +%Y-%m-%d`


# copy ./src/index.html and /src/scripts to ./jetty-app/webapps/map
echo "**INFO: copying source files for HTML and scripts in "$SRC_DIR" to app dir "$APP_DIR
cp $SRC_DIR/index.html $APP_DIR
cp -R $SRC_DIR/scripts $APP_DIR
 
# zip the whole ./jetty-app into a file called "jetty-app.zip"
echo "**INFO: zipping the entire staging dir "$STAGING_DIR
zip -r $ARTIFACT_FILENAME $STAGING_DIR
 
# upload to "https://github.com/groundcontrolME/es-map-jetty/raw/master/es-map-jetty.zip"
echo "**INFO: adding the new artifact to the github repo "$GITHUB_REPO
git add  $ARTIFACT_FILENAME
git commit -m "automated build "$DATE
git push origin master

