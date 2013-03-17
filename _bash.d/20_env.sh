HISTCONTROL=ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
PAGER=less
EDITOR=vi

case "$TERM" in
    xterm*|rxvt*) color=yes;;
esac
if [ -n "$color" ]; then
    PS1="\[\033[00;36m\]\u@\h:\w\[\033[0m\]\n\[\033[00;36m\]\$\[\033[0m\] "
    PS2='\[\033[00;36m\]>\[\033[0m\] '
else
    PS1='\u@\h:\w\n\$ '
    PS2='> '
fi
unset color
