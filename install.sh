#!/usr/bin/env bash

set -eu

BASE_DIR="$(cd $(dirname $0); pwd)"
INSTALL_DIR="$HOME"

if [ "$(uname)" = "Linux" ]; then
  LN_CMD='ln -sfn'
else
  LN_CMD='ln -sfh'
fi

install () {
  local source="$1"
  local dest="$2"

  if [ -d "$source" ]; then
    echo "D $dest"
    mkdir -p "$dest"

    local file
    for file in "$source"/*; do
      local basename="$(basename $file)"
      install "$file" "$dest/$basename"
    done
    return
  fi

  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "B $dest"
    mv "$dest" "$dest.$(date '+%Y%m%d%H%M%S').bak"
  fi

  echo "L $dest"
  $LN_CMD "$source" "$dest"
}

for file in "$BASE_DIR"/_*; do
  basename="$(basename $file)"
  install "$file" "$INSTALL_DIR/.${basename#_}"
done
