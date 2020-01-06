#!/bin/bash
key=最新
dir=`ls`
for i in $dir
do
  if [[ -d $i ]];then
    cd $i
    if [[ `git pull` == *$key* ]];then
      echo -e " --> [最新] $i"
    else
      echo -e "\e[31m ==> [更新] $i\e[0m"
    fi
    cd ..
  fi
done

