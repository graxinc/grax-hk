#!/bin/bash
set -ex

BRANCH_GO=$(echo $RELEASE | cut -d: -f1)
BRANCH_JS=$(echo $RELEASE | cut -d: -f2)

BRANCH_GO=${BRANCH_GO:-master}
BRANCH_JS=${BRANCH_JS:-master}

function download() {
  REPO=$1
  BRANCH=$2
  (
    mkdir -p $REPO && cd $REPO
    curl -Ln -o $BRANCH.zip https://3je5ho83jk.execute-api.us-east-1.amazonaws.com/Prod/pkg/$REPO/$BRANCH
    unzip -o $BRANCH.zip
    rm $BRANCH.zip
    chmod +x grax
  )
}

download graxinc/grax      $BRANCH_GO
download HardingPoint/grax $BRANCH_JS

rm -rf .profile.d jq
