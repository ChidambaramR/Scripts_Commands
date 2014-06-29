#!/bin/sh
dir1_files=(/etc/*)
dir2_files=(/tmp/etc/*)
for ((i=0;i<${#dir1_files[@]};i++)); do
      if [ -f ${dir1_files[i]} ]; then
            [ "${dir1_files[i]}" -nt "${dir2_files[i]}" ] && echo "File $i is newer"
            cmp ${dir1_files[i]} ${dir2_files[i]} 2> /dev/null
            if [ $? -ne 0 ]; then
                    echo "File ${dir1_files[i]} and ${dir2_files[i]} differ"
            fi
      fi
done
