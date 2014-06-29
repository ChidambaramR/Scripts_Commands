#!/bin/sh

echo "Hello world"
exec ls 1> log 2>&1
echo 1233
cat log
