#!/bin/sh

# Install cscope

# The command is as follows
# The command omits the files that are found in following directories
#       non-x86 directories under arch/ and include/asm-*
#       Documentation
#       scripts
#       any tmp directories

LNX="."

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

exit 0
