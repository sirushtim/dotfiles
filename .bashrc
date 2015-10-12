# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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
HISTSIZE=1000
HISTFILESIZE=2000

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
    xterm-color) color_prompt=yes;;
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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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

# Run gertty off virtualenv
alias gertty="/opt/stack/gertty/.tox/pypy/bin/gertty"
alias sl="ls"
alias vmi="vim"
alias demo="source /home/sirushti/dev/devstack/openrc demo demo"
alias admin="source /home/sirushti/dev/devstack/openrc admin admin"
alias hsl="heat stack-list"
alias hsc="heat stack-create"
alias hsd="heat stack-delete"
alias hss="heat stack-show"
alias hrs="heat resource-show"
alias hrl="heat resource-list"
alias hel="heat event-list"
alias rmpyc='find . -name "*.pyc" -exec rm -rf {} \;'
alias myterm='terminator -g /home/sirushti/.config/terminator/config_too'
alias stack="/home/sirushti/dev/devstack/stack.sh"
alias unstack="/home/sirushti/dev/devstack/unstack.sh"
alias rejoin="/home/sirushti/dev/devstack/rejoin-stack.sh"
alias venv="source /opt/stack/heat/.tox/pep8/bin/activate"
alias venv3="source .tox/py34/bin/activate"
alias venv2="source .tox/py27/bin/activate"
alias 3="cd /home/sirushti/dev/heat3/heat"
alias 2="cd /opt/stack/heat/"
alias review="cd ~/git/openstack/heat"
alias 6="2to6"
alias hf="flake8 heat/ heat_integrationtests/ contrib/ bin/"
alias tt="python -m testtools.run"
alias gcad="git commit --amend --date='$(date -R)'"

tt10() {
    for i in {1..10}; do tt $1; done
}

myfind() {
    find ./ | grep -i $1
}

proxy() {
    export http_proxy="";
    export https_proxy=$http_proxy;
}

unset_proxy() {
    unset http_proxy;
    unset https_proxy;
}

PIP_USE_CACHE=1
# For screen to reflect the name of the running process
#export PS1='\[\033k\033\\\]\u@\h:\w\$ '

# notify-osd
LOG=1
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
