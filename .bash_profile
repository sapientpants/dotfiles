# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{extra,bash_prompt,exports,aliases,functions}; do
	[ -r "$file" ] && source "$file"
done
unset file

# Mac OS X bash completion.
if [ -x /usr/local/bin/brew ]; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
fi

# cabal support
if [ -d $HOME/.cabal/bin ]; then
	export PATH="$HOME/.cabal/bin:$PATH"
fi

# cargo support
if [ -d $HOME/.cargo/bin ]; then
	export PATH="$HOME/.cargo/bin:$PATH"
fi

# jabba support
[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

# pyenv support
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# rbenv support
if [ -d $HOME/.rbenv ]; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi

# qt support
if [ -d /usr/local/opt/qt/bin ]; then
        export PATH="/usr/local/opt/qt/bin:$PATH"
fi

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

OS=`uname -s`
if [ "$OS" != "Linux" ]; then
	if [ "${ENABLE_SSH_AGENT}" == "yes" ]; then
		SSH_ENV=$HOME/.ssh/environment

		function start_agent {
			/usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
			chmod 600 ${SSH_ENV}
			. ${SSH_ENV} > /dev/null
			#/usr/bin/ssh-add
		}

		if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     if [ -z "$(ps -ef | grep ssh-agent | grep ${SSH_AGENT_PID})" ]; then
       start_agent
     fi
		else
		  start_agent
		fi
	fi
fi

