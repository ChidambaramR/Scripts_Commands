#!/bin/sh

#This script is used to automatically grab a box and retain it
#   till I wish. This avoids the pain of retaining a box by
#   issuing a command for every 8 hours. So the script automatically
#   does this by waking up after 7 hours and issuing the Art grab
#   command. The script tries to send an email to me, but unfortunately
#   the email client is not installed in the workspace. This is Arista
#   specific

# Check if the user has given any argument
if [ -n "$1" ]; then
     echo "Device under target $1"
else
   echo "Enter the ID of the DUT. Example, mq403"
   exit
fi

SUBJECT="$1 grabbed for another 8 hours";
EMAIL="cramanathan@arista.com";
hostname=$(hostname -f);
EMAILMESSAGE="Script running in $hostname";
mess="Debugging BUG92077"

echo $EMAILMESSAGE > msg.txt
#grabbed_maxHour=$(Art grab -f $1 | cut -d" " -f8- | cut -d":" -f1);
while [ 1 ]; do
     vae=`Art grab -f $1 -c "$mess"`
     current_hour=$(echo `date`  | cut -d" " -f4 | cut -d":" -f1);
     grabbed_maxHour=`expr $current_hour + 8`;
     echo "Box $1 grabbed for 8 more hours"
     /usr/sbin/sendmail -f "cramanathan@arista.com" -s "$SUBJECT" "$EMAIL" < msg.txt
     sleep 7h
done
