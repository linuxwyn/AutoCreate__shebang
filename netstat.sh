#!/usr/bin/bash
#Program:
#Create_time:2018-03-21
#Author:Xiaohui~



export PATH
echo "This program will detect your server's services!"


testfile=/dev/shm/netstat_check.txt
netstat -lnut > ${testfile}
[ "${?}" -eq 1 ] && echo "command 'netstat' not found or program 'netstat' not install"

echo "-----------------------------------------"
echo -e "SERVICE\t\tSTATUS\t\tPORT\t|"
cat services_table | while read port service;do
[ "$(grep ":"${port} "${testfile}")" != "" ] && echo -e "${service}\t\trunning\t\t${port}\t|"
done
echo "-----------------------------------------"
