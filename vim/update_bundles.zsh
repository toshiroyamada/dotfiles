#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
for f in `find bundle -type d -name .git`; do
  echo 
  echo $f
  gitdir=${f%.git}
  cd $gitdir 
  git pull origin master
  cd $DIR
done

