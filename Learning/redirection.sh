#!/bin/bash

# > is the redirection operator
cat abc 1> hello
# cat abc 1> hello - Redirects stdout (1) to a file named hello. The terminal will
#       display the error "No such file or directory", but the file hello will NOY
#       contain anything.

cat abc 2> hello
# cat abc 2> hello - Redirects stderr (2) to a file names hello. Thus in this case
#       even if the file abd does not exist, "no such file or directory will NOT be displayed
#       in the terminal(stdout). Instead it will be redirected to a file names hello. This is
#       because of the 2> command which said, redirect stderr to whatever is on the other side 
#       of the redirection symbol.
#       Thus, the terminal will NOT display anything, but the file names hello will contain the
#       the "Mo such file or directory"

#The above command can be wrote in the following fashion.
(cat abc > hello) 2>&1
#This command will try to display abc into a file hello. After executing it sees that STDERR
#       should be redirected to STDOUT.

#The order of redirections is significant
#       ls > dirlist 2>&1 - directs both standard output (file descriptor 1) and 
#       standard error (file descriptor 2) to the file dirlist,
#Whereas the command
#       ls 2>&1 > dirlist - 
