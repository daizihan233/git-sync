#!/bin/sh

set -e

SOURCE_REPO=$1
SOURCE_BRANCH=$2
DESTINATION_REPO=$3
DESTINATION_BRANCH=$4

SOURCE_REPO="{SOURCE_REPO}"

DESTINATION_REPO="${DESTINATION_REPO}"

echo "SOURCE=$SOURCE_REPO:$SOURCE_BRANCH"
echo "DESTINATION=$DESTINATION_REPO:$DESTINATION_BRANCH"

git clone "$SOURCE_REPO" /root/source --origin source && cd /root/source

git remote add destination "$DESTINATION_REPO"

# Pull all branches references down locally so subsequent commands can see them
git fetch source '+refs/heads/*:refs/heads/*' --update-head-ok

# Print out all branches
git --no-pager branch -a -vv


git push  "${SOURCE_BRANCH}:${DESTINATION_BRANCH}" -f
