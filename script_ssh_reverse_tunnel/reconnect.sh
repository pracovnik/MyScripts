!/usr/bin/env bash
elo=`ps -ef | grep blackberry | wc -l`
if [[ "$elo" -eq 2 ]];
then
#  echo " Is ok, no action needed "
  exit
else
  /usr/bin/ssh -f -N blackberry
fi
