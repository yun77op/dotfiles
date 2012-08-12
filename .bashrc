test -f ~/.bash/env         && . ~/.bash/env
test -f ~/.aliases/aliases  && . ~/.aliases/aliases
test -f ~/.bash/completions && . ~/.bash/completions
test -f ~/.bash/config      && . ~/.bash/config
test -s ~/.rvm/scripts/rvm  && . ~/.rvm/scripts/rvm
test -f ~/.private          && . ~/.private

case "${OSTYPE}" in
  darwin*)
    test -f `brew --prefix`/etc/bash_completion  && \
      . `brew --prefix`/etc/bash_completion
    ;;
  linux*)
    # nothing there
    ;;
esac
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
