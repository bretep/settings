bretep_settings="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ -n "$SSH_TTY" ]; then
	exec screen -xRR
fi
PLATFORM=`uname | sed -n '/Darwin/p'`
if [ $PLATFORM ]; then 
        alias ls='ls -FlhG'
else
        alias ls='ls -Flh --color=auto'
fi
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export EDITOR="$HOME/bin/mate -w"

alias vi=vim
alias vim="vim -u $bretep_settings/.vimrc"

export PROMPT_COMMAND='history -a'
export HISTTIMEFORMAT='%F %T: '
SHORTHOSTNAME=`hostname -s`
HISTFILE=~/.bash_history.$SHORTHOSTNA

source $bretep_settings/.profile
source $bretep_settings/.git-completion
export SCREENRC=$bretep_settings/.screenrc

# enable git unstaged indicators - set to a non-empty value
GIT_PS1_SHOWDIRTYSTATE="."
 
# enable showing of untracked files - set to a non-empty value
GIT_PS1_SHOWUNTRACKEDFILES="."
 
# enable stash checking - set to a non-empty value
GIT_PS1_SHOWSTASHSTATE="."
 
# enable showing of HEAD vs its upstream
GIT_PS1_SHOWUPSTREAM="auto"

BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
LIME_YELLOW=$(tput setaf 190)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)

_build_prompt()
{
    echo -n '$(r=$?; [ 0 == $r ] || echo "${RED}[$r]${MAGENTA} ")'
    echo -n '${MAGENTA}\u${GREEN} at ${RED}\H${GREEN}'
    echo -n ' in ${MAGENTA}\w ${GREEN}${MAGENTA}$(__git_ps1 "${GREEN}on${MAGENTA} %s")'
    echo -n '\n$ '
}
 
PS1=$(_build_prompt)

export PATH=/usr/local/sbin:/opt/local/bin:/opt/local/sbin:$PATH

  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
