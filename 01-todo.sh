#!/bin/bash
dir=$(ls)
NEED_PULL="git pull"
NEED_ADD="Untracked files"
NEED_COMMIT="Changes not staged for commit"
NEED_PUSH="git push"
OK="nothing to commit, working tree clean"
todo="update.md"
for i in ${dir}; do
  if [[ -d ${i} ]]; then
    cd "${i}" || exit
    echo "==> [${i}] --> [$(git remote get-url --push origin)]"
    ## 获取 git 状态信息
    if ! stat=$(LANG=en_US git remote update && LANG=en_US git status); then
      echo "[ERROR] not a git repository or failure remote update"
    else
      if [[ $stat == *$NEED_PULL* ]]; then
        echo "[WARNING][need pull]"
      fi
      if [[ $stat == *$NEED_ADD* ]]; then
        echo "[WARNING][need add]"
      fi
      if [[ $stat == *$NEED_COMMIT* ]]; then
        echo "[WARNING][need commit]"
      fi
      if [[ $stat == *$NEED_PUSH* ]]; then
        echo "[WARNING][need push]"
      fi
      if [[ $stat == *$OK* ]]; then
        echo "[OK] $OK"
      fi
    fi

    if [[ -f $todo ]]; then
      while read -r line; do
        if [[ $line = "## "*"."*"."* ]]; then
          break
        else
          echo "$line"
        fi
      done <$todo
    else$version"
      echo "[ERROR] no update.md file..."
      echo ""
    fi
    cd ..
  fi
done
