# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Alias
# alias meuip="echo $(ip addr show | grep /24 | awk '{print $2}')"
# inxi -i | grep -i 'WAN' # Public IP Addr
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=3000
HISTFILESIZE=4000
HISTTIMEFORMAT="%d/%m/%y - %T ├ " #│ " # Formato do history

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

###################################################
#                      PS1                        #
###################################################

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\n🧙 \[\033[01;32m\]\u \[\033[01;34m\]\w \[\033[04;32m$(echo -e $?)\033[00m\] \[\033[01;34m\]$(TEMPO_INICIO $ROOTPID)\033[00m\n\$ ' # $(TEMPO_INICIO $ROOTPID)s
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

PS2="\033[32m|\033[0m> "

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
complete -W "\$(gf -list)" gf
alias mongodb-start="mongod --noauth --dbpath ~/mongodb/data/db/"

###################################################
#                     Banner                      #
###################################################
ROXO_="\x1b[38;5;57m"
TRON_="\033[38;5;105m"
FIM_="\x1b[00m"
echo -e "\n${TRON_}*------------------------------------*\n"
echo -e "          ~${FIM_} TERMINAL FR0ST ${TRON_}~${FIM_}            "
echo -e "  LINUX CONSOLE:" $(date +"%d/%m/%y | %T")

[[ "$USER" == "rodric" ]]&& echo -e "\t   Welcome, \x1b[38;5;57mMaster\x1b[0m."
echo -e "\n${TRON_}*------------------------------------*${FIM_}\n"
echo -e "\n - ${TRON_}Alias:${FIM_}\n   skycon"


###################################################
#                  Configurações                  #
###################################################

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH:$HOME/.local/bin
export PATH="$PATH:$HOME/.axiom/interact"
alias ccat="pygmentize -g" # Cat para .c, .sh e etc
alias hcat="source-highlight --out-format=esc -o STDOUT -i" # Cat para .html
alias peso="du -sxh /home/rodric/* | sort -rh | head -n10"

alias ipl="ip -4 addr show eth0 | grep -Po '(?<=inet\s)\d+(\.\d+){3}'"

alias nmap='"/mnt/c/Program Files (x86)/Nmap/nmap.exe"'

# Cores de pesquisa / search highlight do less:
export LESS_TERMCAP_so=$(echo -e '\e[38;5;105m') # Azul tron
export LESS_TERMCAP_se=$(echo -e '\e[0m') # Fim


###################################################
#               Tempo de Execução                 #
###################################################

ARREDONDA_(){
  # Arredonda um número para 3 casas decimais
  echo m=$1";h=0.5;scale=4;t=1000;if(m<0) h=-0.5;a=m*t+h;scale=3;a/t;" | bc
}

TEMPO_PARTIDA(){
  # Coloca o tempo de período em NS na memória compartilhada
  date +%s.%N >"/dev/shm/${USER}.bashtime.${1}"
}

TEMPO_INICIO(){
  local endtime=$(date +%s.%N)
  local starttime=$(cat /dev/shm/${USER}.bashtime.${1})
  ARREDONDA_ $(echo $(eval echo "$endtime - $starttime") | bc)
}

ROOTPID='$BASHPID'
TEMPO_PARTIDA $ROOTPID

PS0='$(TEMPO_PARTIDA $ROOTPID)'

runonexit(){
  rm /dev/shm/${USER}.bashtime.${ROOTPID}
}

trap runonexit EXIT
