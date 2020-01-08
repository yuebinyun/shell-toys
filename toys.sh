#!/bin/bash
#
# shell 脚本的学习
# code style from : https://google.github.io/styleguide/shell.xml
# shell-check from : https://github.com/koalaman/shellcheck
#

###############################################################################
# print error info with date
# Argument:
#   any
# Returns:
#   None
###############################################################################
err() {
  echo "[$(date +'%Y-%m-%d %H:%M:%S%z')]: $*" >&2
}

# err "hell"

###############################################################################
# 学习 loop
###############################################################################
loop() {
  for i in 1 2 3 4 5 6 7; do
    echo "${i}"
  done
}

loop

###############################################################################
# 跨行
###############################################################################
echo "now is $(date)"\
  echo "now is $(date)"

## case 语句
v="123"
case "${v}" in
  "123") echo "123" ;;
  "456") echo "456" ;;
  *) echo "other" ;;
esac

echo "$$ \$\$\$"

readonly ABC=123
echo ${ABC}

if [[ -n ${no} ]]; then
  echo "-n \${no} is not null"
else
  echo "-n \${no} is null"
fi

if [[ -z ${no} ]]; then
  echo "-z \${no} is null"
else
  echo "-z \${no} is not null"
fi

my_function() {
  var_for_global="$(date)"
  echo "${var_for_global}"
  local var_in_fun
  var_in_fun="$(date)"
  echo "${var_in_fun} in my_function()"
}

my_function
echo "${var_in_fun}"
echo "${var_for_global}"


## 读取文件每一行
# while read -r f
# do
#   echo "${f}"
# done < update.md

## 高级循环，未必适用所有 适用 bash， 不适用 shell
# mkdir rc{0,1,2,3,4,5,6,S}.d
echo 今天是星期{一,二,三,四,五,六,日}啊.
echo 今天是 星期{一,二,三,四,五,六,日} 啊.
# output 
# 今天是星期一啊. 今天是星期二啊. 今天是星期三啊. 今天是星期四啊. 今天是星期五啊. 今天是星期六啊. 今天是星期日啊.
# 今天是 星期一 星期二 星期三 星期四 星期五 星期六 星期日 啊.


# 判断语句
abc="abc"
efg="efg"
if [[ "${abc}" = "${efg}" ]]; then
  echo "${abc} == ${efg}"
else
  echo "${abc} != ${efg}"
fi

a=1
b=2
if [[ $a -eq $b ]]; then
  echo "${a} == ${b}"
else
  echo "${a} != ${b}"
fi
## output 
# 1 != 2

c=01
if [[ $a -eq $c ]]; then
  echo "$a -eq $c"
else
  echo "$a -ne $c"
fi
## !output
# 1 == 01

d="02"
if [[ $b -eq $d ]]; then
  echo "$b -eq $d"
else
  echo "$b -ne $d"
fi

if [[ $b != $d ]]; then
  echo "$b != $d"
fi

# 读取控制台的输入
# x=0
# while [[  -n "${x}" ]]; do
#   echo -n "enter something : "
#   read -r x
#   echo "--> ${x}"
# done

echo "参数个数 $#"

## 判断
if [[ $(id -u) -eq 0 ]]; then
  echo "run as root..."
else
  echo "run as not root... "
fi

## 输出为申明的变量
echo $lllll

## 默认值
## 如果 myname 变量未申明，如下情况
echo "Your name is : ${myname:-John Doe}"
## output
## echo "Your name is : John Doe"

## ** shift 的用法
shift; shift

echo "$@"