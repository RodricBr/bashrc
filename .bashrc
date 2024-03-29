# This is my next edition bash prompt
# Credit -> github.com/RodricBr 2022

# First alternative (first concept)

PS1='${debian_chroot:+($debian_chroot)}\n\[\e[0;$(($?==0?0:91))m\]*\[\e[0m\]\[\033[38;5;57m\]┌[\u⏐🧙⏐\h]\[\033[00m\]\[\033[01;34m\] \w\n\[\033[00m\]\[\033[38;5;57m\] └─\[\033[00m\]\[\033[32;5m\]$\[\033[0m\] '

# The prompt will be displayed as such: 
#
# *┌[rodric⏐🧙⏐debian] ~
#  └─$ command --example
#
# * == Exit code (red = not 0)

###############################################################

# Second alternative (better)

PS1='${debian_chroot:+($debian_chroot)}\n\[\033[38;5;57m\]┌[\u⏐🧙⏐\h]\[\033[00m\]\[\033[01;34m\] \w \[\033[4;32m\]$(echo $?)\n\[\033[00m\]\[\033[38;5;57m\]└─\[\033[00m\]\[\033[32;5m\]$\[\033[0m\] '

# The prompt will be displayed as such:
#
# ┌[rodric⏐🧙⏐debian] ~/Directory ͟1͟3͟3͟7
# └─$ command --example
#
# 1337 == Exit code number green colored and underlined

###############################################################

# Third alternative (simpler)

PS1='${debian_chroot:+($debian_chroot)}\n\[\033[01;32m\]\u \[\033[00m\]\[\033[01;34m\]\w \[\033[00;32m$(echo $?)\033[00m\]\n\$ '

# The prompt will be displayed as such:
#
# rodric ~ ͟1͟3͟3͟7
# $
#
# 1337 == Exit code number green colored and underlined

###############################################################

# Bonus: PS2 (Continuation interactive prompt)

export PS2='\033[32m└─🢒\033[00m '

# The prompt will be displayed as such when there's a line break:
#
# └─$ echo \
# └─🢒 testing. \
# └─🢒 .line two \
# testing..line two

###############################################################

# Bonus: History Format

HISTTIMEFORMAT="%d/%m/%y - %T ├ "

# The format shall be:
# └─$ history
# 506  01/02/23 - 23:23:23 ├ history
