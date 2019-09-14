#!/bin/bash
set -o errexit

# config
git config --global user.email "eleonora.barelli2@unibo.it"
git config --global user.name "Travis CI"

# build
rm -rf public
mkdir public
cp css public/css
cp index.html public/
cp favicon.ico public/

# deploy
cd public
git init
git add .
git commit -m "Deploy to Github Pages"
git push --force --quiet "https://${GITHUB_TOKEN}@$github.com/${GITHUB_REPO}.git" master:gh-pages > /dev/null 2>&1
