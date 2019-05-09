/root/mysqlpcap -l yourip|awk '{ if($3 > 0 ) {$1=""; print $0 } }'| grep tablename|grep SELECT

or run capsql.sh scripts
