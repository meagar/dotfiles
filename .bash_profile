
alias ls='ls -lFG'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'

alias rake='bundle exec rake'
alias tt='touch tmp/restart.txt'

export LESS='-RNM'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

parse_git_branch () {
	git branch 2> /dev/null | grep "\*" | sed -e 's/\* //g'
}

export PS1='\n\[\e[0;32m\]\h/\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]$(parse_git_branch) \$\[\e[m\] \[\e[0m\]'
#export PS1='\n\h/\u \w $(parse_git_branch) \$ '

export USER_BASH_COMPLETION_DIR=~/.bash_completion.d

if [ -f /usr/local/etc/bash_completion ]; then
	. /usr/local/etc/bash_completion
fi

export EDITOR="/usr/bin/vim"

set -o vi
