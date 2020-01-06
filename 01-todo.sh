#!/bin/bash
echo [`pwd`]
version="## "*"."*"."*
while read line
do
  if [[ $line == $version ]]; then
    break
  else
    echo "$line"
  fi
done < update.md
