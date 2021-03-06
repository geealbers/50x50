#!/bin/bash

# Change this if you change the output folder in config.yml
BUILD_DIR="public"

DIR=$(dirname "$0")
cd $DIR/..

# if [[ $(git status -s) ]]
# then
#     echo "The working directory is dirty. Please commit any pending changes."
#     exit 1;
# fi

echo "Deleting old publication"
rm -rf $BUILD_DIR
mkdir $BUILD_DIR

echo "Generating site"
# hugo --config=config.yml,config.build.yml
quire build

echo "Updating gh-pages branch"
git add $BUILD_DIR && git commit -m "Automated deploy at $(date)."
git subtree push --prefix $BUILD_DIR origin gh-pages

