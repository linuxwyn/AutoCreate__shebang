#!/bin/bash
id $1 > /dev/null 2>&1
[ "$?" ! -eq 0 ] && useradd $1 || echo User: $1 exist

for i in `cat groups_table`
do
	grep $i /etc/group > /dev/null 2>&1
	[ "$?" -eq 0 ] && : || echo Group $i not exist,but i will create it right now
done | awk '{print $2}' | xargs -n1 groupadd
