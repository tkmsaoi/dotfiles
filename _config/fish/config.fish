#
# Environment
#---

fish_add_path /usr/local/bin

if type -q brew
  fish_add_path (brew --prefix)/bin
  fish_add_path (brew --prefix)/sbin
end

fish_add_path $HOME/local/bin

#
# asdf
#---

if type -q asdf
  if type -q brew
    source (brew --prefix asdf)/libexec/asdf.fish
  end
end

#
# Interactive Setup
#---

if status is-interactive
  set fish_greeting

  alias g=git
  alias d=docker
  alias dc=docker-compose
  alias pbc=pbcopy
  alias pbp=pbpaste

  if type -q starship
    starship init fish | source
  end
end

#---

if test -e ~/.config/fish/config.fish.local
  source ~/.config/fish/config.fish.local
end
