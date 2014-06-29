#!/bin/sh
a=3
if [ "$a" -gt 0 ]; then
     if [ "$a" -lt 5 ]
     then
         echo "The value of \"a\" lies somewhere between 0 and 5."
     fi
fi
# Same result as:
if [ "$a" -gt 0 ] && [ "$a" -lt 5 ]; then
   echo "The value of \"a\" lies somewhere between 0 and 5."
fi

#And command
# if [ $condition1 ] && [ $condition2 ]
   #  Same as:  if [ $condition1 -a $condition2 ]
   #  Returns true if both condition1 and condition2 hold true...

#OR Command
# if [ $condition1 ] || [ $condition2 ]
   # Same as:  if [ $condition1 -o $condition2 ]
   # Returns true if either condition1 or condition2 holds true...
