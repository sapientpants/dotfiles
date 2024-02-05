# History is best left in the past
if [ -f $HISTFILE ]; then
  rm -f $HISTFILE
fi
unset HISTFILE

# Clean up less history
if [ -f $LESSHISTFILE ]; then
  rm -f $LESSHISTFILE
fi
export LESSHISTFILE="-"

# Options
setopt AUTO_CD
setopt CORRECT
#setopt CORRECT_ALL
setopt NO_CASE_GLOB
setopt PROMPT_SUBST

# Exports
export EDITOR="vim"
export MANPAGER="less -X"
export VAGRANT_DEFAULT_PROVIDER=virtualbox
if [ -f $HOME/.exports ]; then
  source $HOME/.exports
fi

# Aliases
alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
alias g="git"
alias ll="ls -al"
alias p="cd ~/Projects"

# cabal support
if [ -d $HOME/.cabal/bin ]; then
	export PATH="$HOME/.cabal/bin:$PATH"
fi

# cargo support
if [ -d $HOME/.cargo/bin ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# asdf
. $(brew --prefix asdf)/libexec/asdf.sh
[ -s "$HOME/.asdf/plugins/java/set-java-home.zsh" ] && . ~/.asdf/plugins/java/set-java-home.zsh

# postgresql support
export PATH="$PATH:$(brew --prefix postgresql@15)/bin"

# Prompt
#autoload -Uz vcs_info
#zstyle ':vcs_info:*' enable git
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:git*' formats " %s  %r/%S %b (%a) %m%u%c"
#precmd () {
#  vcs_info
#  print -rP "[%n@%m %1~${vcs_info_msg_0_}]"
#}
#prompt='%# '
eval "$(starship init zsh)"

# Functions
fpath=( ~/.zshfn "${fpath[@]}" )
for i in ~/.zshfn/*; do autoload -Uz `basename $i`; done
