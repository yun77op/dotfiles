[[ -f ~/.zsh/config ]]      && .  ~/.zsh/config
[[ -f ~/.zsh/aliases ]]     && .  ~/.zsh/aliases
[[ -f ~/.zsh/completion ]]  && .  ~/.zsh/completion
[[ -f ~/.bash/paths ]]      && .  ~/.bash/paths       # same paths for bash and zsh

# rvm
[[ -f ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm