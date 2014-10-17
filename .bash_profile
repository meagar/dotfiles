alias .git="git --work-tree=$HOME --git-dir=$HOME/projects/dotfiles.git"

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
alias thor='bundle exec thor'
alias rspec='bundle exec rspec'
alias tt='touch tmp/restart.txt'
alias rails="bundle exec rails"
alias foreman="bundle exec foreman"
alias guard="bundle exec guard"

export LESS='-RNM'

export PS1='\n\[\e[0;32m\]\h/\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]$(__git_ps1) \$\[\e[m\] \[\e[0m\]'
# Staging:
#export PS1='\n\[\e[0;33m\]\h/\u\[\e[m\] \[\e[1;33m\]\w\[\e[m\] \[\e[0;33m\]$(parse_git_branch) \$\[\e[m\] \[\e[0m\]'
# Production
#export PS1='\n\[\e[0;31m\]\h/\u\[\e[m\] \[\e[1;31m\]\w\[\e[m\] \[\e[0;31m\]$(parse_git_branch) \$\[\e[m\] \[\e[0m\]'

#export USER_BASH_COMPLETION_DIR=~/.bash_completion.d

if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

export GOPATH=~/.go

export PATH="$PATH:~/bin:/usr/local/sbin:$GOPATH/bin"

# Enable rbenv shims
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
