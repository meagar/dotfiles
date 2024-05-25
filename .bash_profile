alias .git="git --work-tree=$HOME --git-dir=$HOME/src/github.com/meagar/dotfiles/.git"

export BASH_SILENCE_DEPRECATION_WARNING=1

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
alias gp="git pull"
alias gci="git commit"
alias gap="git add -p"
alias gpfwl="git push --force-with-lease"

alias rake='bundle exec rake'
alias thor='bundle exec thor'
alias rspec='bundle exec rspec'
alias tt='touch tmp/restart.txt'
alias rails="bundle exec rails"
alias foreman="bundle exec foreman"
alias guard="bundle exec guard"

export LESS='-RNM'

export PS1='\n\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\[\e[1;32m\]$(__git_ps1) \$\[\e[m\] \[\e[0m\]'
# Staging:
#export PS1='\n\[\e[0;33m\]\h/\u\[\e[m\] \[\e[1;33m\]\w\[\e[m\] \[\e[0;33m\]$(parse_git_branch) \$\[\e[m\] \[\e[0m\]'
# Production
#export PS1='\n\[\e[0;31m\]\h/\u\[\e[m\] \[\e[1;31m\]\w\[\e[m\] \[\e[0;31m\]$(parse_git_branch) \$\[\e[m\] \[\e[0m\]'

#export USER_BASH_COMPLETION_DIR=~/.bash_completion.d


export PATH="/usr/local/sbin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# export PATH="$HOME/.rbenv/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/bin:$PATH"

set -o vi

export CDPATH="$CDPATH:$HOME/src/github.com/"

alias tf="terragrunt"
alias tg="terragrunt"
alias terraform="terragrunt"
alias tgp="tg plan --terragrunt-source-update"
alias tgp-prod="AWS_PROFILE=production tgp"
alias tg-prod="AWS_PROFILE=production tg"
alias tgp-dev="AWS_PROFILE=dev tgp"
alias tg-dev="AWS_PROFILE=dev tg"
alias dc="docker-compose"

export EDITOR=nvim

eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

export PATH=/opt/homebrew/opt/openssl@3/bin:$PATH
export DISABLE_MODEL_SCHEMA=1

export GOPATH=~/.go
export GOROOT=/usr/local/go/
export PATH="$PATH:~/.cargo/bin"
export PATH="~/.local/bin:$PATH"


# Enable rbenv shims
eval "$(rbenv init -)"
alias vim=nvim
alias vi=nvim

export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

export DISABLE_MODEL_SCHEMA=1

# Ctrl+D won't close the shell; instead must type "exit" or "logout"
set -o ignoreeof

export PATH="~/.rubies/ruby-master/bin:/usr/local/sbin:$PATH"
