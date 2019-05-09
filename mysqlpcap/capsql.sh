#!/bin/bash

if [ ! -n "$1" ] ;then
    echo "you have not input a ip!"
    exit 0
fi

BACKUPDATE=`date +%Y%m%d-%H%M%S`

cd /data1/dumpdata/

listeningip=$1

/root/mysqlpcap -d -l $listeningip -f /data1/dumpdata/$listeningip-$BACKUPDATE.out

mypid=`ps -ef|grep $listeningip| grep -v 'grep' |grep mysqlpcap |awk '{print $2}'`

sleep 10

kill -9 $mypid

cat $listeningip-$BACKUPDATE.out |awk -F " FROM " '{print $2}' |awk '{print $1}'|tr -s '\n' | awk '{a[$1]+=1;}END{for(i in a){print a[i]" ",i;}}'|sort -n |tail -10 >$listeningip-$BACKUPDATE-sql.out
