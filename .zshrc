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
setopt CORRECT_ALL
setopt NO_CASE_GLOB
setopt PROMPT_SUBST

# Exports
export EDITOR="vim"
export MANPAGER="less -X"
export VAGRANT_DEFAULT_PROVIDER=virtualbox

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

# jabba support
[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"

# pyenv support
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# rbenv support
if [ -d $HOME/.rbenv ]; then
        export PATH="$HOME/.rbenv/bin:$PATH"
        eval "$(rbenv init -)"
fi

# Prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git*' formats " %b"
precmd () {
  vcs_info
  print -rP "[%1~${vcs_info_msg_0_}]"
}
prompt='\$ '

# Functions
fpath=( ~/.zshfn "${fpath[@]}" )
for i in ~/.zshfn/*; do autoload -Uz `basename $i`; done
