# Options
set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showupstream "informative"

# Colors 
# See: https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized#the-values
set green (set_color 859900)
set magenta (set_color d33682)
set normal (set_color normal)
set red (set_color d30102)
set yellow (set_color b58900)

set __fish_git_prompt_color_branch 6c71c4 # violet
set __fish_git_prompt_color_flags 
set __fish_git_prompt_color_dirtystate white
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_untrackedfiles 6c71c4 # violet
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red


# Icons
set __fish_git_prompt_char_cleanstate ' 👍  '
set __fish_git_prompt_char_conflictedstate ' ⚠️  '
set __fish_git_prompt_char_dirtystate ' 💩  '
set __fish_git_prompt_char_invalidstate ' 🤮  '
set __fish_git_prompt_char_stagedstate ' 🚥  '
set __fish_git_prompt_char_stashstate ' 📦  '
set __fish_git_prompt_char_stateseparator ' | '
set __fish_git_prompt_char_untrackedfiles ' 🔍  '
set __fish_git_prompt_char_upstream_ahead ' ☝️  '
set __fish_git_prompt_char_upstream_behind ' 👇  '
set __fish_git_prompt_char_upstream_diverged ' 🚧  '
set __fish_git_prompt_char_upstream_equal ' 💯 ' 


# function fish_prompt
#   set last_status $status

#   set_color $fish_color_cwd
#   printf '%s' (prompt_pwd)
#   set_color normal

#   printf '%s ' (__fish_git_prompt)
#   echo
#   # echo -n "🐠 "
#   echo -n '$ '
#   set_color normal
# end

# # Highlight the user name when logged in as root.
# if [[ "${USER}" == "root" ]]; then
#         userStyle="${red}";
# else
#         userStyle="${orange}";
# fi;

# # Highlight the hostname when connected via SSH.
# if [[ "${SSH_TTY}" ]]; then
#         hostStyle="${bold}${red}";
# else
#         hostStyle="${yellow}";
# fi;

function __set_user_color
  set_color cb4b16
end

function __set_host_color
  set_color yellow
end

function fish_prompt
  set last_status $status

  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end
  if not set -q __fish_prompt_char
    switch (id -u)
      case 0
        set -g __fish_prompt_char '#'
      case '*'
        set -g __fish_prompt_char '$'
    end
  end

  # Line 1
  __set_user_color
  printf "$USER"

  set_color normal
  printf '@'

  __set_host_color
  printf "$__fish_prompt_hostname "
  set_color normal

  # set_color $fish_color_cwd
  set_color green
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  # Line 2
  echo
  # echo -n "🐠 "
  echo -n "$__fish_prompt_char "
  set_color normal
end
