# Leave no trace
unset HISTFILE

# Options
setopt AUTO_CD
setopt CORRECT
setopt CORRECT_ALL
setopt NO_CASE_GLOB

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
  eval "$(pyenv init -)"
fi

# rbenv support
if [ -d $HOME/.rbenv ]; then
        export PATH="$HOME/.rbenv/bin:$PATH"
        eval "$(rbenv init -)"
fi

# Modules
zmodload -a mapfile

# Functions
fpath=( ~/.zshfn "${fpath[@]}" )
for f in docker_clean \
         docker_del_stopped \
         docker_relies_on \
         postgres \
         psql
do
        autoload -Uz $f
done
