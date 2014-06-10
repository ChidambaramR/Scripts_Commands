#!/bin/sh

# Install cscope

# The command is as follows
# The command omits the files that are found in following directories
#       non-x86 directories under arch/ and include/asm-*
#       Documentation
#       scripts
#       any tmp directories

LNX="."

echo "** Enter y for building cscope for a LINUX kernel or n for building for a normal project **"
read type

if [ "$type" = "y" ]; then

echo "Finding relevant source files..."
find $LNX                                                                \
       -path "$LNX/arch/*" ! -path "$LNX/arch/x86*" -prune -o               \
       -path "$LNX/include/asm-*" ! -path "$LNX/include/asm-generic*"       \
                                 ! -path "$LNX/include/asm-x86*" -prune -o \
       -path "$LNX/tmp*" -prune -o                                          \
       -path "$LNX/Documentation*" -prune -o                                \
       -path "$LNX/scripts*" -prune -o                                      \
       -name "*.[chxsS]" -print > $LNX/cscope.files

echo "Building cscope database..."
time cscope -q -b -i cscope.files

echo "\n Building CTAGS. Please hold on.."
ctags -L cscope.files

exit 0

else
    find $LNX -name "*.[chxsS]" > cscope.files
    cscope -q -b -i cscope.files
    ctags -L cscope.files
fi


