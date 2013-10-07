# This simple zsh configuration is a tweaked version of the one
# by Geoffrey Grosenbach featured in his blog. See http://peepcode.com

# Colors
autoload -U colors
colors
setopt prompt_subst

# Prompt
local smiley="%(?,%{$fg[green]%}😄%{$reset_color%},%{$fg[red]%}😭%{$reset_color%})"
PROMPT='
%~
${smiley}  %{$reset_color%}'
RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt)$(~/dotfiles/git-cwd-info)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# Path modifications
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:/usr/local/heroku:/usr/local/heroku/bin

# Scala SBT: Add bin to PATH for Scala binaries
if [ -d ~/tools/sbt/ ]; then
  PATH=$PATH:~/tools/sbt/bin
fi

# Add Play path for using the Play framework
if [ -d ~/tools/play-2.2.0/ ]; then
  PATH=$PATH:~/tools/play-2.2.0
fi

# Add SML path if present
if [ -d ~/tools/sml/ ]; then
  PATH=$PATH:~/tools/sml/bin
fi

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color'
alias ll="ls -alrtF --color"
alias la="ls -A"
alias l="ls -CF"
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias m='less'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias md='mkdir'
alias cl='clear'
alias du='du -ch --max-depth=1'
alias treeacl='tree -A -C -L 2'
alias em='emacs -nw'     # No X11 windows
alias eqq='emacs -nw -Q' # No config and no X11

# rvm: load rvm into a shell session *as a function*
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# node.js and nvm
# http://nodejs.org/api/repl.html#repl_repl
alias node="env NODE_NO_READLINE=1 rlwrap node"
alias node_repl="node -e \"require('repl').start({ignoreUndefined: true})\""
export NODE_DISABLE_COLORS=1
if [ -s ~/.nvm/nvm.sh ]; then
    NVM_DIR=~/.nvm
    source ~/.nvm/nvm.sh
    nvm use v0.10.12 &> /dev/null # silence nvm use; needed for rsync
fi

# NVM added 27.07.2012
# following http://ghosttx.com/2012/04/nvm-cheat-sheet-node-version-manager/
. ~/.nvm/nvm.sh

# These commands are custom for my current installation
if [[ $USER = "hibai" || $USER = "eneibai" ]]; then

  # Special aliases
  alias tilemill='nvm run 0.8 /usr/share/tilemill/index.js'
  alias sublime='/opt/sublime_text/sublime_text'
  alias pomodoro='echo "aplay ~/hibai/bell.wav" | at now + 25 min'
fi
