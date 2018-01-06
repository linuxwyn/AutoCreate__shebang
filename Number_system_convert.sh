#!/bin/bash
if [ ! -x $0 ]
then
  chmod u+x $0
fi
echo "scale=6;obase=$2;ibase=$1;$3" | bc        #scale指精度，ibase指的是你输入数字的进制，同字面意思，obase指的你想得到的进制
 
