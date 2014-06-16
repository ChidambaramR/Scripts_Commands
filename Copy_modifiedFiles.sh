#!/bin/sh

# This script automatically checks the files in the source directory which are
#   different from those in the detination directory. If it finds a more recent
#   version of a source file, then it copies only those files to the destination
#   directory resulting in a synced version of the source and the destination files. 
#   This is Arista specific

curr="."
prev=".."
for i in `ls -a`
do
     if [ "$i" = "$curr" ] || [ "$i" = "$prev" ] || [ "$i" = "copy_modified_files.sh" ]; then
         continue
     fi
     cmp /bld/EosKernel/Artools-rpmbuild/linux-3.4/net/sched/$i $i
     if [ ! $? -eq 0 ]; then
         echo "Copying $i..."
         cp $i /bld/EosKernel/Artools-rpmbuild/linux-3.4/net/sched/
     fi
done
