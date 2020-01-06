#!/bin/bash
dir=`ls`
version="## "*"."*"."*
todo="update.md"
for i in $dir
do
  if [[ -d $i ]]; then
    cd $i
    echo "==> [$i]"
    if [[ -f $todo ]]; then
      while read line
      do
        if [[ $line == $version ]]; then
	  break
	else
          echo "$line"
	fi
      done < $todo
    else
      echo "[ERROR] 该项目下没有 update.md 文件"
      echo ""
    fi
    cd ..
  fi
done
