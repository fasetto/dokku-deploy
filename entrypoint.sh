#!/bin/bash

DEPLOY_KEY=$1
DOKKU_HOST=$2
DOKKU_APP=$3
DOKKU_USER=$4
FORCE_PUSH=$5

echo "Setting up ssh environment."

mkdir -p ~/.ssh
eval `ssh-agent -s`
ssh-add - <<< $DEPLOY_KEY
ssh-keyscan $DOKKU_HOST >> ~/.ssh/known_hosts

echo "Preparing to push."
repo="$DOKKU_USER@$DOKKU_HOST:$DOKKU_APP"

cd $GITHUB_WORKSPACE

git remote add dokku $repo

GIT_CMD="git push dokku master"

if [ "$FORCE_PUSH" == true ]; then
    echo "Enabled force push."
    git_cmd="git push dokku master --force"
fi

echo "Deploy started."

GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" $GIT_CMD
