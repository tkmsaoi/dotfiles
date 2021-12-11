alias ll='ls -Fl'
alias la='ls -Fal'
alias less='less -MR'
alias sudo='sudo '

if command -v gdircolors >/dev/null 2>&1; then
    alias dircolors='gdircolors'
    alias ls='gls --color=auto'
elif command -v dircolors >/dev/null 2>&1; then
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

if command -v colordiff >/dev/null 2>&1; then
    alias diff='colordiff'
fi

if [ -x "/Applications/Emacs.app/Contents/MacOS/Emacs" ]; then
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
fi

if command -v pbcopy >/dev/null 2>&1; then
  alias pbc='pbcopy'
  alias pbp='pbpaste'
fi
