# bashrc do SSH (JuiceSSH android)
# o segundo ps1 do debian é interpretado pelo juice como sendo o terminal ssh
# Ex:
# if...
# ps1='...'
# else
# ps1='SSH'

PS1='${debian_chroot:+($debian_chroot)}\n+ \[\033[38;5;57m\]\w\033[38;5;255m\] :: \[\033[38;5;57m\]\[\033[48;5;99m\]\u\[\033[38;5;8m\]\[\033[0m\] $ '
