# bashrc do SSH (JuiceSSH android)
# o segundo ps1 do debian é interpretado pelo juice como sendo o terminal ssh
# Ex:
# if...
# ps1='...'
# else
# ps1='SSH'

# Modelo 1 (muito maneiro, modelo meu)
PS1='${debian_chroot:+($debian_chroot)}\n+ \[\033[38;5;57m\]\w\033[38;5;255m\] :: \[\033[38;5;57m\]\[\033[48;5;99m\]\u\[\033[38;5;8m\]\[\033[0m\] $ '

# Modelo 2 (mais legal ainda, e foi feito 100% por mim)
PS1='${debian_chroot:+($debian_chroot)}\n\[\033[0;34;1m\]┌[\u⏐🎩⏐\h \[\033[0;0;41m\][SSH]\[\033[1;37m\]\[\033[00m\]\[\033[1;31m\] \w\n\[\033[00m\]\[\033[0;34;1m\]└─\[\033[00m\]\033[0;34m\]$\[\033[00m\] '
