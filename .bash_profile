alias .git="git --work-tree=$HOME --git-dir=$HOME/src/github.com/meagar/dotfiles/.git"

export BASH_SILENCE_DEPRECATION_WARNING=1

alias ls='ls -lFGh'
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
alias sidekiq="bundle exec sidekiq"
alias foreman="bundle exec foreman"
alias guard="bundle exec guard"
alias srb="bundle exec srb"
alias tp="bundle exec tapioca"

alias jobs="jobs -l"

export LESS='-RNM'

export PS1='\n \[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]\n\[\e[1;32m\]$(__git_ps1) \$\[\e[m\] \[\e[0m\]'
# Staging:
#export PS1='\n\[\e[0;33m\]\h/\u\[\e[m\] \[\e[1;33m\]\w\[\e[m\] \[\e[0;33m\]$(parse_git_branch) \$\[\e[m\] \[\e[0m\]'
# Production
#export PS1='\n\[\e[0;31m\]\h/\u\[\e[m\] \[\e[1;31m\]\w\[\e[m\] \[\e[0;31m\]$(parse_git_branch) \$\[\e[m\] \[\e[0m\]'

export USER_BASH_COMPLETION_DIR=~/.bash_completion.d

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
alias dc="docker-compose -f docker/development/compose.yml"

export EDITOR=nvim

eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

export PATH=/opt/homebrew/opt/openssl@3/bin:$PATH
export PATH="~/go/bin:$PATH"

#export GOROOT=/usr/local/go/
#export PATH="$PATH:~/.cargo/bin"
#. "$HOME/.cargo/env"
#export PATH="~/.rubies/ruby-master/bin:/usr/local/sbin:$PATH"
#export PATH="~/.local/bin:$PATH"

# Enable rbenv shims
#eval "$(rbenv init -)"
alias vim=nvim
alias vi=nvim

# Ctrl+D won't close the shell; instead must type "exit" or "logout"
set -o ignoreeof

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/meagar/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/meagar/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/meagar/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/meagar/Downloads/google-cloud-sdk/completion.bash.inc'; fi
#export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

_thorcomplete() {
  local cur
  _get_comp_words_by_ref -n : cur

  COMPREPLY=($(compgen -W "`bundle exec thor list | grep 'thor ' | cut -d " " -f 2`" -- $cur))

  __ltrim_colon_completions "$cur"
}
complete -o default -o nospace -F _thorcomplete thor

_rakecomplete() {
  local cur
  _get_comp_words_by_ref -n : cur

  COMPREPLY=($(compgen -W "`bundle exec rake -T | cut -d " " -f 2`" -- $cur))

  __ltrim_colon_completions "$cur"
}
complete -o default -o nospace -F _rakecomplete rake

export RUBY_YJIT_ENABLE=1

# Seems to help with tmux capturing ctrl+\ where I want that to kill the current process

#tmux unbind-key -T root 'C-\'

#ssh-add ~/.ssh/github_ed25519
#ssh-add ~/.ssh/mighty-session-manager-production
#ssh-add ~/.ssh/mighty-session-manager-staging
#-e 
. /opt/homebrew/opt/asdf/libexec/asdf.sh

alias dev="mightydev"

# Postgres.app binaries
export PATH="/Applications/Postgres.app/Contents/Versions/17/bin:$PATH"

source ~/.bash_completion.d/jira.sh
. "$HOME/.cargo/env"

# uv
export PATH="/Users/matteagar/.local/bin:$PATH"

source ~/.git-prompt.sh
