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
# ┌[rodric⏐🧙⏐debian] ~/Directory ͟1͟3͟3͟7
# └─$ command --example
#
# 1337 == Status code number green colored and underlined

###############################################################

# Third alternative (simple)

PS1='${debian_chroot:+($debian_chroot)}\n\[\033[01;32m\]\u \[\033[00m\]\[\033[01;34m\]\w \[\033[00;32m$(echo $?)\033[00m\]\n\$ '

# The prompt will be displayed as such:
#
# rodric ~ 1337
# $
#
# 1337 == Status code number green colored and underlined
