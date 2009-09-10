if [ -f ~/.bash/aliases ] ; then source ~/.bash/aliases ; fi
if [ -f ~/.bash/completions ] ; then source ~/.bash/completions ; fi
if [ -f ~/.bash/paths ] ; then source ~/.bash/paths ; fi
if [ -f ~/.bash/config ] ; then source ~/.bash/config ; fi
if [ -f ~/.bash/classpath ] ; then source ~/.bash/classpath ; fi
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
if [ -f ~/.bashrc ] ; then . ~/.bashrc ; fi
  
if [ -f /opt/local/etc/bash_completion ]; then
  . /opt/local/etc/bash_completion
fi
