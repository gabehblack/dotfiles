#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
export PATH="$HOME/.rbenv/shims:$PATH"

set XDG_CURRENT_DESKTOP=sway
set EDITOR=nvim

alias ls='ls --color=auto'
alias icat='kitty +kitten icat'
alias grep='grep --color=auto'
alias beep="echo $'\a'"

alias nv='nvim'

alias dcr='docker compose run --rm runner'
alias dcur='rm -f ./tmp/pids/server.pid; docker compose up rails'
alias dcrp='docker compose run -T -u 1000:1000 --rm runner bundle exec pronto run --staged'
alias dcrs='docker compose run --rm runner bundle exec rspec'
alias dcus='docker compose run --rm runner bundle exec sidekiq'
alias hrc='heroku run rails c --remote production'

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
