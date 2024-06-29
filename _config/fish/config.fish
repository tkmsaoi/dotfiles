#
# Environment
#---

fish_add_path /usr/local/bin

begin
  set brew_cmd
  for dir in /opt/homebrew/bin /usr/local/bin
    set brew_cmd $dir/brew
    if test -x $brew_cmd
      fish_add_path ($brew_cmd --prefix)/bin
      fish_add_path ($brew_cmd --prefix)/sbin
      break
    end
  end
end

if test -d /usr/local/share/dotnet/x64
  fish_add_path /usr/local/share/dotnet/x64
end

if test -d $HOME/.dotnet/tools
  fish_add_path $HOME/.dotnet/tools
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
  alias l='ls -al'
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
