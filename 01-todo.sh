#!/bin/bash
dir=`ls`
NEED_PULL="git pull"
NEED_ADD="未跟踪"
NEED_COMMIT="要提交的变更"
NEED_PUSH="使用 \"git push\" 来发布您的本地提交"
OK="无文件要提交，干净的工作区"
version="## "*"."*"."*
todo="update.md"
for i in $dir
do
  if [[ -d $i ]]; then
    cd $i
    echo "==> [$i]"
    ## 获取 git 状态信息
    stat=`git remote update && git status`
    if [[ "$?" -ne "0" ]]; then
      echo "[ERROR] 该目录不是 git 仓库，或者同步失败"
    else
      if [[ $stat == *$NEED_PULL* ]]; then
        echo "[WARNING][need pull] 本地分支落后远程分支"
      fi
      if [[ $stat == *$NEED_ADD* ]]; then
	echo "[WARNING][need add] 本地仓库$NEED_ADD"
      fi
      if [[ $stat == *$NEED_COMMIT* ]]; then
	echo "[WARNING][need commit] 本地仓库有$NEED_COMMIT"
      fi
      if [[ $stat == *$NEED_PUSH* ]]; then
	echo "[WARNING][need push] 本地仓库有本地提交未发布"
      fi
      if [[ $stat == *$OK* ]]; then
	echo "[OK] $OK"
      fi
    fi

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
