################################################################################
# ZSH
################################################################################
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git jump osx ruby)
source "${ZSH}/oh-my-zsh.sh"

_completemarks() {
  reply=($(ls "${MARKPATH}"))
}

compctl -K _completemarks jump
compctl -K _completemarks unmark

setopt no_nomatch
setopt interactivecomments

################################################################################
# Env
################################################################################
export VISUAL="emacs"
export EDITOR="emacs"
export CLICOLOR="1"
export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"

################################################################################
# Aliases
################################################################################
alias ls="ls -p"
alias ll="ls -lhp"
alias be="bundle exec"
alias tmuxa="tmux a -t 0"
alias ssh_tunnel="ssh -D 8080 -C -N"
alias compose="docker-compose"
alias gkubectl="gcloud preview container kubectl"

################################################################################
# .bashrc
################################################################################
alias edit_profile="${EDITOR} ${HOME}/.bashrc"
alias resource_profile="source ${HOME}/.zprofile && source ${HOME}/.zshrc"

################################################################################
# Docker
################################################################################
docker_stop_containers() {
  docker stop $(docker ps -a -q)
}

docker_rm_dangling() {
  docker ps --no-trunc -a -q | xargs docker rm
  docker images -q --filter "dangling=true" | xargs docker rmi
}

docker_run_bash() {
  local image="$1"
  shift 1
  docker run -ti --name="${image}" "${image}" bash "$@"
}

docker_exec_bash() {
  local container="$1"
  shift 1
  docker exec -ti --name="${container}" "${container}" bash "$@"
}

docker_run_daemon() {
  local image="$1"
  shift 1
  docker run -d --name "${image}" "$@" "${image}"
}

docker_ip() {
  docker inspect -f {{.NetworkSettings.IPAddress}} "$1"
}

tabs_to_spaces() {
  local types=$1
  find . -name "$1" ! -type d -exec \
    bash -c 'expand -t 2 "$0" > /tmp/e && mv /tmp/e "$0"' {} \;
}

################################################################################
# Git
################################################################################
gpull() {
  git fetch && git pull --rebase origin "$(_current_branch)"
}

gpush() {
  git push origin "$(_current_branch)"
}

grebase() {
  git fetch && git rebase "origin/$(_current_branch)"
}

_current_branch() {
  git rev-parse --abbrev-ref HEAD
}

################################################################################
# Other .dotfiles
################################################################################
[[ -f "${HOME}/.osxrc" ]] && source "${HOME}/.osxrc"
[[ -f "${HOME}/.localrc" ]] && source "${HOME}/.localrc"

################################################################################
# Ruby
################################################################################
RAILS_ENV=test
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && . "${HOME}/.rvm/scripts/rvm"

