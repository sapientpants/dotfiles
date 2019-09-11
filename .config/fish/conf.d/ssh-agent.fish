# OS=`uname -s`
# if [ "$OS" != "Linux" ]; then
# 	if [ "${ENABLE_SSH_AGENT}" == "yes" ]; then
# 		SSH_ENV=$HOME/.ssh/environment

# 		function start_agent {
# 			/usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
# 			chmod 600 ${SSH_ENV}
# 			. ${SSH_ENV} > /dev/null
# 			#/usr/bin/ssh-add
# 		}

# 		if [ -f "${SSH_ENV}" ]; then
#      . ${SSH_ENV} > /dev/null
#      if [ -z "$(ps -ef | grep ssh-agent | grep ${SSH_AGENT_PID})" ]; then
#        start_agent
#      fi
# 		else
# 		  start_agent
# 		fi
# 	fi
# fi