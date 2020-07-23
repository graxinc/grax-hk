#!/bin/bash
set -ex

BRANCH_GO=$(echo $RELEASE | cut -d: -f1)
BRANCH_JS=$(echo $RELEASE | cut -d: -f2)

cat >$HOME/.netrc <<EOF
machine api.github.com
password $GITHUB_TOKEN
EOF

curl -L -o jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
chmod +x jq

function download() {
  REPO=$1
  BRANCH=$2
  RUN_ID=$(curl -sn "https://api.github.com/repos/$REPO/actions/workflows/artifacts.yml/runs?branch=$BRANCH" | ./jq -r '.workflow_runs[0].id')
  URL=$(curl -sn "https://api.github.com/repos/$REPO/actions/runs/$RUN_ID/artifacts" | ./jq -r '.artifacts[0].archive_download_url')
  (
    mkdir -p $REPO && cd $REPO
    curl -Ln -o $BRANCH.zip $URL
    unzip -o $BRANCH.zip
    rm $BRANCH.zip
    chmod +x grax
  )
}

download graxinc/grax      $BRANCH_GO
download HardingPoint/grax $BRANCH_JS

rm -rf .profile.d jq
