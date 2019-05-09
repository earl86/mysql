/root/mysqlpcap -l yourip|awk '{ if($3 > 0 ) {$1=""; print $0 } }'| grep player_activity_ranking_history|grep SELECT
