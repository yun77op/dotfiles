test -f ~/.bash/aliases                      && . ~/.bash/aliases
test -f ~/.bash/completions                  && . ~/.bash/completions
test -f ~/.bash/paths                        && . ~/.bash/paths
test -f ~/.bash/config                       && . ~/.bash/config
test -f ~/.bash/classpath                    && . ~/.bash/classpath
test -s ~/.rvm/scripts/rvm                   && . ~/.rvm/scripts/rvm
test -f ~/.bashrc                            && . ~/.bashrc
test -f `brew --prefix`/etc/bash_completion  && . `brew --prefix`/etc/bash_completion