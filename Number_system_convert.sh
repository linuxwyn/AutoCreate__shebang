#!/bin/bash
echo "scale=6;obase=$2;ibase=$1;$3" | bc        #scale指精度，ibase指的是你输入数字的进制，同理，obase指的你想得到的进制
