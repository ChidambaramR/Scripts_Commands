#!/bin/sh

#Double quotes are generally used when we need to substitute the entire value,
#       even if the value contains spaces. For example, if a directory contains
#       file test 1.zip, the command for f in *.zip;do unzip $f;done will give an
#       error saying test no such file or directory. Instead we should give
#       for f in *.zip;do unzip "$f";done
test=pwd
echo $test
echo "$test"
echo '$test'
echo `$test`
