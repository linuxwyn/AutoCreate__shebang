set -eux          #对该脚本设置在执行过程中出错了就不往下继续执行的命令
wegt -c $1        #利用wegt下载你所需要的源码包，支持断点下载，其中这里的$1是你的下载源码包的网址
tar -zvcf $2      #利用tar解压你所下载的源码包
cd $2*            #进入解压后的目录
./configure --prefix=/usr/local/$2 --conf-path=/etc/$2/$2".conf"          #配置安装目录和配置文件目录，这里可以自行更改
make              #make会去查找makefile文件，利用系统的编译链接工具执行编译和链接，这里要注意可能有些库文件缺失导致出错
make clean        #清除以前的旧的项目
make install      #执行安装，OK。接下来就是一写配置文件的更改了
