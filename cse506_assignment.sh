#!/bin.sh
curr="."
prev=".."
fname="test1.sh"
eva="Eval"
temp="template3.git"
for i in `ls -a ./../`
do
if [ "$i" = "$curr" ] || [ "$i" = "$prev" ] || [ "$i" = "$fname" ] || [ "$i" = "$eval" ] || [ "$i" = "$eva" ] || [ "$i" = "$temp" ]; then
continue
fi
git clone ./../$i
echo "Sending $i to /var/services/homes/cramanathan/cse506/submissions/cse506-hw2/$i"
ssh -p 2229 cramanathan@compas.cs.stonybrook.edu "mkdir /var/services/homes/cramanathan/cse506/submissions/cse506-hw2/$i"
echo "\n Sending hw2"
scp -r -P 2229 $i/hw2/ cramanathan@compas.cs.stonybrook.edu:/var/services/homes/cramanathan/cse506/submissions/cse506-hw2/$i
echo "\n Sending fs/wrapfs"
scp -r -P 2229 $i/fs/wrapfs cramanathan@compas.cs.stonybrook.edu:/var/services/homes/cramanathan/cse506/submissions/cse506-hw2/$i
rm -rf $i
done
