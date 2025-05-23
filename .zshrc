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
export EDITOR="nvim"
export MANPAGER="less -X"
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# Aliases
alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
alias g="git"
alias p="cd ~/Projects"
alias ls='eza -lh --group-directories-first --icons --hyperlink'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias vi='nvim'
alias vim='nvim'

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

# mise
eval "$(/opt/homebrew/bin/mise activate zsh)"

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
