#!/bin/bash

DEPLOY_KEY=$1
DOKKU_HOST=$2
DOKKU_APP=$3
DOKKU_USER=$4
FORCE_PUSH=$5

# Setup ssh environment
mkdir -p ~/.ssh
eval `ssh-agent -s`
ssh-add - <<< $DEPLOY_KEY
ssh-keyscan $DOKKU_HOST >> ~/.ssh/known_hosts

repo="$DOKKU_USER@$DOKKU_HOST:$DOKKU_APP"

cd $GITHUB_WORKSPACE

git remote add dokku $repo

if [ "$FORCE_PUSH" == true ]; then
    git push dokku master -f
else
    git push dokku master
fi

exit 0
