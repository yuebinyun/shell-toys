# shell-toys
自己整理的一些 shell 脚本

## 00-check.sh
### 功能
检查某个目录下，每个 git 仓库工程是否已经更新到最新。

### 目标输出
```bash
 --> [最新] blog-toys
 --> [最新] cpp-toys
 --> [最新] launcher
 --> [最新] n-near
 --> [最新] no
 --> [最新] shell-toys
 --> [最新] yuebinyun.github.io
```

### 目的
养成每日同步代码的好习惯。

## 01-todo.sh
### 功能
打印某个目录下，所有二级目录下的，update.md 文件中的 todo 部分

### 目标输出
```
==> [blog-toys] --> [git@github.com:yuebinyun/blog-toys.git]
[OK] 无文件要提交，干净的工作区
[ERROR] 该项目下没有 update.md 文件

==> [c-toys] --> [git@github.com:yuebinyun/c-toys.git]
[OK] 无文件要提交，干净的工作区
[ERROR] 该项目下没有 update.md 文件

==> [launcher] --> [git@github.com:yuebinyun/launcher.git]
[OK] 无文件要提交，干净的工作区
## TODO
* $^%&*^%*&^&%$^%$^%^*^&*
* %^&%&%*^%*&^%^*&%&^%*%&*&)*%^&^(&^(&
* %^&*()(%$^&)&*&^*&^(*&(*&%$%

==> [shell-toys] --> [git@github.com:yuebinyun/shell-toys.git]
[WARNING][need add] 本地仓库未跟踪
[ERROR] 该项目下没有 update.md 文件
```
### 
