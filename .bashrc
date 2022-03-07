# This is my next edition bash prompt
# Credit -> github.com/RodricBr 2022

PS1='${debian_chroot:+($debian_chroot)}\n\[\e[0;$(($?==0?0:91))m\]*\[\e[0m\]\[\033[38;5;57m\]┌[\u⏐🧙⏐\h]\[\033[00m\]\[\033[01;34m\] \w\n\[\033[00m\]\[\033[38;5;57m\] └─\[\033[00m\]\[\033[32;5m\]$\[\033[0m\] '

# The prompt will be displayed as such: 
#
# *┌[rodric⏐🧙⏐debian] ~
#  └─$ command --example
#
# * == Stauts code (red = not 0)

###############################################################

# Second alternative (better)

PS1='${debian_chroot:+($debian_chroot)}\n\[\033[38;5;57m\]┌[\u⏐🧙⏐\h]\[\033[00m\]\[\033[01;34m\] \w \[\033[4;32m\]$(echo $?)\n\[\033[00m\]\[\033[38;5;57m\]└─\[\033[00m\]\[\033[32;5m\]$\[\033[0m\] '

# The prompt will be displayed as such:
#
# ┌[rodric⏐🧙⏐debian] ~/Directory 123
# └─$ command --example
#
# 123 == Status code number green colored and underlined
