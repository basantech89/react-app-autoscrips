#!/usr/bin/env sh

a="bla"
echo $a
if [ -n "$a" ]; then
  echo "exists"
else
  echo "doesnt"
fi