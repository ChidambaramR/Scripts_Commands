#!/bin/sh

# Script to automatically make the kernel , SCP it if successfull and reboot the box if all were successful.
# Arista Specific
if [ -n "$1" ]; then
   echo "Device under target $1"
else
   echo "Enter the ID of the DUT. Example, mq403"
   exit
fi

(cd /bld/EosKernel/Artools-rpmbuild/linux-*/;rm -rf include/config;ARCH=x86_64 make -j8 O=bld-x86_64 bzImage modules && sudo cp bld-x86_64/arch/x86/boot/bzImage /images/linux-i386) && (cd /images/;sudo zip -r ./EOS.swi ./linux-i386)


# Return status of a command is stored in the $?
RESULT=$?
if [ $RESULT -eq 0 ]; then
   scp /images/EOS.swi root@$1:/mnt/flash/EOS.swi
   if [ $? -eq 0 ]; then
      ssh admin@$1
      enable
      reboot
   else
      echo "Cannot SCP IMAGE!!!"
   fi
else
   echo "MAKE FAILURE!!!"
fi
