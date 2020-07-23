#!/bin/bash

BUILD=$(curl -n -X POST https://api.heroku.com/apps/$HEROKU_APP/builds \
  -d '{"source_blob":{"url":"https://github.com/graxinc/grax-hk/archive/master.tar.gz"}}' \
  -H 'Accept: application/vnd.heroku+json; version=3' \
  -H "Content-Type: application/json")

OUTPUT=$(echo "$BUILD" | jq -r .output_stream_url)

curl $OUTPUT