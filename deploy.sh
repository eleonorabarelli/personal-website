#!/bin/bash
set -o errexit
set -x
# config
git config --global user.email "eleonora.barelli2@unibo.it"
git config --global user.name "Travis CI"

# build
rm -rf public
mkdir public
cp -r css index.html favicon.ico public/

# deploy
cd public
git init
git add .
git commit -m "Deploy to Github Pages"
git push --force --quiet "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git" master:master > /dev/null 2>&1
