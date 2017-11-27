set -eux
wegt -c $1
tar -zvcf $2
cd $2*
./configure --prefix=/usr/local/$2 --conf-path=/etc/$2/$2".conf"
make
make clean
make install

