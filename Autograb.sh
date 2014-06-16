#!/bin/sh

#This script is used to automatically grab a box and retain it
#   till I wish. This avoids the pain of retaining a box by
#   issuing a command for every 8 hours. So the script automatically
#   does this by waking up after 7 hours and issuing the Art grab
#   command. The script tries to send an email to me, but unfortunately
#   the email client is not installed in the workspace. This is Arista
#   specific

SUBJECT="$1 grabbed for another 8 hours";
EMAIL="cramanathan@arista.com";
hostname=$(hostname -f);
EMAILMESSAGE="Script running in $hostname";

#grabbed_maxHour=$(Art grab -f $1 | cut -d" " -f8- | cut -d":" -f1);
while [ 1 ]; do
     vae=`Art grab -f $1`
     current_hour=$(echo `date`  | cut -d" " -f4 | cut -d":" -f1);
     grabbed_maxHour=`expr $current_hour + 8`;
     echo "Box $1 grabbed for 8 more hours"
     #   /bin/mail -s "$SUBJECT" "$EMAIL" < $EMAILMESSAGE
     sleep 7h
done
