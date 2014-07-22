#!/bin/bash

# some variables
# refactoring the script such that all these values are
# passed from the outside as arguments should be easy

from="$1"
to="cramanathan@arista.com"
subject="Some fancy title"
boundary="ZZ_/afg6432dfgkl.94531q"
body="This is the body of our email"
declare -a attachments
attachments=( "$2" )

# Build headers
{

printf '%s\n' "From: $from
To: $to
Subject: $subject
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=\"$boundary\"

--${boundary}
Content-Type: text/plain; charset=\"US-ASCII\"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

$body
"

# now loop over the attachments, guess the type
# and produce the corresponding part, encoded base64
for file in "${attachments[@]}"; do

  [ ! -f "$file" ] && echo "Warning: attachment $file not found, skipping" >&2 && continue

  mimetype=`file --mime-type $file | awk '{print $2}'`

  printf '%s\n' "--${boundary}
Content-Type: $mimetype
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=\"$file\"
"

  base64 "$file"
  echo
done

# print last boundary with closing --
printf '%s\n' "--${boundary}--"

} | sendmail -t -oi   # one may also use -f here to set the envelope-from
