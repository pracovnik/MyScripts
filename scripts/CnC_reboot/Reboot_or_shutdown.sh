wwww=$(curl https://www.onedrive.com/CCID=1124f532 )

if [[ $(echo "$wwww" | grep "reboot" | wc -l)+$(echo "$wwww" | grep "restart" | wc -l) == "1+1" ]] ;
then
        sudo /sbin/reboot
fi


if [[ $(echo "$wwww" | grep "turnoff" | wc -l)+$(echo "$wwww" | grep "shutdown" | wc -l) == "1+1" ]] ;
then
        echo "yes shutdown"
        sudo /sbin/shutdown
fi
