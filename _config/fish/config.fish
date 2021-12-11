if status is-interactive
    set fish_greeting

    alias g=git
    alias d=docker
    alias dc=docker-compose
    alias pbc=pbcopy
    alias pbp=pbpaste

    starship init fish | source
end
