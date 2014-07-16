#!/bin/sh

# Search for one pattern in file. If that patter matches go to next file.
# Find the target pattern in files which do not match the first patter

for i in `ls /var/log/console/`
do
  grep -qi "DELIBERATE KERNEL CRASH" /var/log/console/$i
  if [ $? -eq 0 ]; then
    # Do not search in these files
    continue
  fi
  # Search in all other files
  grep -qi "kernel panic" /var/log/console/$i
  if [ $? -eq 0 ];
  then
    # We have found the pattern in those files which do not match 1st pattern
    # Display the file name
    echo $i
  fi
done
