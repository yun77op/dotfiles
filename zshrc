. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

[[ -f ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
