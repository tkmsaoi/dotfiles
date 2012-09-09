#!/bin/sh
for i in _*
do
    source="$PWD/$i"
    target="$HOME/.${i#_}"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        mv $target $target.`date '+%Y%m%d%H%M%S'`.bak
    fi
    ln -sfh $source $target
done
