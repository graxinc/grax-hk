# GRAX HK

## Quick Start

Set `RELEASE` to `branch1:branch2`. If a branch is omitted `master` is assumed.

Then `./deploy.sh` will build and release a slug from the given artifacts.

```
$ export HEROKU_APP=grax-app
$ heroku config:set RELEASE=branch1:branch2
$ ./deploy.sh
-----> Node.js app detected
-----> Build
       Running build

download branch1
unzip -o branch1.zip
download branch2
unzip -o branch2.zip

-----> Build succeeded!
-----> Discovering process types
       Procfile declares types -> grax-asynch, grax-asynch-bulk, web
-----> Compressing...
       Done: 72.6M
-----> Launching...
       Released v19
       https://grax-app.herokuapp.com/ deployed to Heroku
```