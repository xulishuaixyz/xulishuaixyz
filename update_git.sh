#! /bin/bash

#vi update_git.sh
file_1=.gitignore 
file_2=readme 
file_3=log.txt

for((i=1; i <= 3; i++))
do


t_file=file_$i

dest=`eval echo '$'"$t_file"`

if [ ! -f $dest ];then
    echo "creat $dest file"
	touch $dest

if [ $dest == $file_1 ];then


echo "*.o
*.a
*.h264
*.aac
*.jpg
*.flv
*/*.h264
*.yuv
*.264
*.grg
*.mpeg4
si_gs
si_ss
*.[oa]
*.exe
*.so
*.so.[0-9]
*.dylib
*.obj
" >> $dest


fi

if [ $dest == $file_2 ];then

echo "
大屏拼接项目使用说明：
本目录设计思路为一套源代码使用一种工具链编译，包含编译、清除、是否编译live555等情况，具体命令如下

(1)编译整个工程目录(不包括live555目录)：
	./build all

(2)编译整个工程（包括live555目录）
	./build live555=y

(3)清除整个工程目录的编译文件：
	./build clean

说明：
	1 编译完成后，生成的可执行文件在bin目录下面，需要拷贝到板子上面运行
		a： board.app 是板子上面运行的client(负责操作海思底层的接口)
		b： skyworyh.app 是板子上面运行的server（响应客户端指令，以及发命令给client）

" >> $dest


fi

if [ $dest == $file_3 ];then 

echo "
2017/2/28更新..................

">> $dest


fi

fi
done


Usage(){
echo usage:
			echo "$0 1 https://xulishuaixyz@bitbucket.org/xulishuaixyz/3536cloudsplice.git"  "//(ps: your git repo -- first upload)"
			echo "$0 2 m_xx"  "//(ps: what's change -- second ... upload)"
			echo "$0 3 https://xulishuaixyz@bitbucket.org/xulishuaixyz/3536cloudsplice.git"  "//(ps first download you web repo)"
}

if [ $# -ne 2 ]; then
{
    echo "arguments error"
    Usage
    exit 1
}
fi

if [ "$1" = "1" ];then
{
#echo "do 1 cmd"
#exit 1
sleep 10
rm .git -rf
git init .
git add .
git commit -m "first_time"  
git remote add origin $2
git push origin master
}
elif [ "$1" = "2" ];then
{

#echo "do 2 cmd"
#exit 1
git add -A .
git commit -m $2
git push origin master 
}
elif [ "$1" = "3" ];then
{
	echo "git chone $2"
	sleep 10
	git clone $2
}
else
{
	Usage
	exit 1
}
fi

echo "do update $2 work finish"
