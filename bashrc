test -f ~/.bash/paths       && . ~/.bash/paths
test -f ~/.bash/aliases     && . ~/.bash/aliases
test -f ~/.bash/completions && . ~/.bash/completions
test -f ~/.bash/config      && . ~/.bash/config
test -s ~/.rvm/scripts/rvm  && . ~/.rvm/scripts/rvm

case "${OSTYPE}" in
  darwin*)
    test -f `brew --prefix`/etc/bash_completion  && \
      . `brew --prefix`/etc/bash_completion
    ;;
  linux*)
    # nothing there
    ;;
esac