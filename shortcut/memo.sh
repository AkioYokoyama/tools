#!/bin/bash
if [ $# = 0 ]; then
  fname=memo
else
  fname=$1
fi

if [ -n "$2" ]; then
  ext=$2
else
  ext=md
fi

touch ~/Desktop/$fname.$ext
open ~/Desktop/$fname.$ext
