alias sudo='sudo '
alias ll='ls -Fal'
alias less='less -MR'
alias be='bundle exec'

alias install-composer='curl -sS https://getcomposer.org/installer | php'
alias composer='php composer.phar'

if [ -x "$(which gdircolors)" ]; then
    alias dircolors='gdircolors'
    alias ls='gls --color=auto'
elif [ -x "$(which dircolors)" ]; then
    alias ls='ls --color=auto'
elif [ "$(uname)" = "Darwin" ]; then
    alias ls='ls -G'
fi

case "$TERM" in
    xterm*|rxvt*) color=yes;;
esac
if [ -n "$color" ]; then
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
unset color

if [ -x "$(which colordiff)" ]; then
    alias diff='colordiff'
fi

if [ -x "/Applications/Emacs.app/Contents/MacOS/Emacs" ]; then
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
fi
