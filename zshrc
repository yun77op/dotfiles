[[ -f ~/.zsh/config ]]      && .  ~/.zsh/config
[[ -f ~/.bash/aliases ]]    && .  ~/.bash/aliases      # idem for bash and zsh
[[ -f ~/.zsh/completion ]]  && .  ~/.zsh/completion
[[ -f ~/.bash/paths ]]      && .  ~/.bash/paths       # idem for bash and zsh

# rvm
[[ -f ~/.rvm/scripts/rvm ]] && . ~/.rvm/scripts/rvm