set -eux
if which pip;then
	echo pip installed
else
	if [ `whoami` = "root" ];then
		yum -y install pip
	else
		if sudo yum -y install pip;then
			echo As sudoer execate yum to install pip
		else
			echo permission denied,please contact Administrator
echo 'alias pip="pip --disable-pip-version-check"' >> ~/.bashrc
source ~/.bashrc

mkdir -p ~/.config/.pip/
cd ~/.confif/.pip/
touch pip.conf
echo "[global]" >> pip.conf
echo "index-url = https://pypi.tuna.tsinghua.edu.cn/simple" >> pip.conf
pip install $1
