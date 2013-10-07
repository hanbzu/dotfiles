# This simple zsh configuration is a tweaked version of the one
# by Geoffrey Grosenbach featured in his blog. See http://peepcode.com


# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

# Colors
autoload -U colors
colors
setopt prompt_subst

# Prompt
local smiley="%(?,%{$fg[green]%}😄%{$reset_color%},%{$fg[red]%}😭%{$reset_color%})"

PROMPT='
%~
${smiley}  %{$reset_color%}'

RPROMPT='%{$fg[white]%} $(~/.rvm/bin/rvm-prompt)$(~/bin/git-cwd-info)%{$reset_color%}'

# Replace the above with this if you use rbenv
# RPROMPT='%{$fg[white]%} $(~/.rbenv/bin/rbenv version-name)$(~/bin/git-cwd-info.rb)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# Add RVM to PATH for scripting
PATH=$PATH:$HOME/.rvm/bin

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll="ls -l"
alias gg='git log --oneline --abbrev-commit --all --graph --decorate --color'

# These commands are custom for my current installation
if [[ $USER = "hibai" || $USER = "eneibai" ]]; then

  # Add SBT bin to PATH for Scala binaries
  PATH=$PATH:$HOME/hibai/ikasten/functional_programming_scala/sbt/bin

  # Add Play path for using the Play framework
  PATH=$PATH:$HOME/hibai/tools/play-2.2.0

  # NVM added 27.07.2012
  # following http://ghosttx.com/2012/04/nvm-cheat-sheet-node-version-manager/
  . ~/nvm/nvm.sh

  # Special aliases
  alias tilemill='nvm run 0.8 /usr/share/tilemill/index.js'
  alias sublime='/opt/sublime_text/sublime_text'
  alias pomodoro='echo "aplay ~/hibai/bell.wav" | at now + 25 min'
fi
