[[ -f ~/.zsh/config ]]      && .  ~/.zsh/config
[[ -f ~/.zsh/aliases ]]     && .  ~/.zsh/aliases
[[ -f ~/.zsh/completion ]]  && .  ~/.zsh/completion
[[ -f ~/.zsh/paths ]]       && .  ~/.zsh/paths

[[ -f ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]]         && .  ~/.localrc

# rvm
[[ -f ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm