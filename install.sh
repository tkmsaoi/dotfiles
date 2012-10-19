#!/bin/sh
if [ "`uname`" = "Linux" ]; then
    LN_OPTS=-sfn
else
    LN_OPTS=-sfh
fi

for i in _*
do
    source="$PWD/$i"
    target="$HOME/.${i#_}"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        mv $target $target.`date '+%Y%m%d%H%M%S'`.bak
    fi
    ln $LN_OPTS $source $target
done
