alias .git='git --work-tree=/Users/matthew.eagar --git-dir=/Users/matthew.eagar/projects/dotfiles.git'

alias ls='ls -lFG'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'

alias s="git status -s"
alias d="git diff"
alias lg="git lg"
alias gco="git checkout"
alias gm="git merge --no-ff"
alias gmf="git merge -ff-only"
alias gp="git smart-pull"
alias gci="git commit"
alias gap="git add -p"

alias rake='bundle exec rake'
alias tt='touch tmp/restart.txt'
alias rails="./script/rails"

export LESS='-RNM'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

parse_git_branch () {
	git branch 2> /dev/null | grep "\*" | sed -e 's/\* //g'
}

export PS1='\n\[\e[0;32m\]\h/\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]$(parse_git_branch) \$\[\e[m\] \[\e[0m\]'
#export PS1='\n\h/\u \w $(parse_git_branch) \$ '

export USER_BASH_COMPLETION_DIR=~/.bash_completion.d

if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

export EDITOR="/usr/bin/vim"

set -o vi

export PATH="~/bin:$PATH"

# Enable rbenv shims
eval "$(rbenv init -)"
