################################################################################
# Env
################################################################################
export VISUAL="nano"
export EDITOR="nano"
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

################################################################################
# .bashrc
################################################################################
alias edit_profile="${EDITOR} ${HOME}/.bashrc"
alias resource_profile="source ${HOME}/.profile && source ${HOME}/.bashrc"

################################################################################
# Docker
################################################################################
function docker_stop_containers() {
  docker stop $(docker ps -a -q)
}

function docker_rm_dangling() {
  docker ps --no-trunc -a -q | xargs docker rm
  docker images -q --filter "dangling=true" | xargs docker rmi
}

function docker_run_bash() {
  local image="$1"
  shift 1
  docker run -ti --name="${image}" "${image}" bash "$@"
}

function docker_exec_bash() {
  local container="$1"
  shift 1
  docker exec -ti --name="${container}" "${container}" bash "$@"
}

function docker_run_daemon() {
  local image="$1"
  shift 1
  docker run -d --name "${image}" "$@" "${image}"
}

function docker_ip() {
  docker inspect -f {{.NetworkSettings.IPAddress}} "$1"
}

function tabs_to_spaces() {
  local types=$1
  find . -name "$1" ! -type d -exec \
    bash -c 'expand -t 2 "$0" > /tmp/e && mv /tmp/e "$0"' {} \;
}

################################################################################
# Git
################################################################################
function gpull() {
  git fetch && git pull --rebase origin "$(_current_branch)"
}

function gpush() {
  git push origin "$(_current_branch)"
}

function grebase() {
  git fetch && git rebase "origin/$(_current_branch)"
}

function _current_branch() {
  git rev-parse --abbrev-ref HEAD
}

################################################################################
# Other .dotfiles
################################################################################
[[ -f "${HOME}/.osxbashrc" ]] && source "${HOME}/.osxbashrc"
[[ -f "${HOME}/.localbashrc" ]] && source "${HOME}/.localbashrc"

################################################################################
# Ruby
################################################################################
[[ -s "${HOME}/.rvm/scripts/rvm" ]] && . "${HOME}/.rvm/scripts/rvm"
