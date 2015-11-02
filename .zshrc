################################################################################
# ZSH
################################################################################
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(gitfast jump osx ruby tmuxinator docker node npm web-search)
source "${ZSH}/oh-my-zsh.sh"

_completemarks() {
  reply=($(ls "${MARKPATH}"))
}

compctl -K _completemarks jump
compctl -K _completemarks unmark

setopt no_nomatch
setopt interactivecomments

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
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

################################################################################
# .bashrc
################################################################################
alias edit_profile="${EDITOR} ${HOME}/.zshrc"
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
  docker run -ti --name "${image}" "${image}" bash "$@"
}

docker_exec_bash() {
  local container="$1"
  shift 1
  docker exec -ti --name "${container}" "${container}" bash "$@"
}

docker_run_daemon() {
  local image="$1"
  shift 1
  docker run -d --name "${image}" "$@" "${image}"
}

docker_ip() {
  docker inspect -f "{{.NetworkSettings.IPAddress}}" "$1"
}

tabs_to_spaces() {
  local types="$1"
  find . -name "$1" ! -type d -exec \
    bash -c 'expand -t 2 "$0" > /tmp/e && mv /tmp/e "$0"' {} \;
}

################################################################################
# Git
################################################################################
gpull() {
  git fetch
  git pull --rebase origin "$(_current_branch)"
}

gpush() {
  git push origin "$(_current_branch)"
}

grebase() {
  git fetch
  git rebase "origin/$(_current_branch)"
}

_current_branch() {
  git rev-parse --abbrev-ref HEAD
}

################################################################################
# Other .dotfiles
################################################################################
if [[ -f "${HOME}/.localrc" ]]; then
  source "${HOME}/.localrc"
fi

################################################################################
# Ruby
################################################################################
RAILS_ENV=test
if [[ -s "${HOME}/.rvm/scripts/rvm" ]]; then
  source "${HOME}/.rvm/scripts/rvm"
fi

################################################################################
# JavaScript
################################################################################
source  "${HOME}/.nvm/nvm.sh"

if [[ "$(uname)" == "Darwin" ]]; then
  ################################################################################
  # docker-machine
  ################################################################################
  docker_start() {
    docker-machine start dev
    eval "$(docker-machine env dev)"
  }

  ################################################################################
  # Finder
  ################################################################################
  show_all_files() {
    defaults write com.apple.finder AppleShowAllFiles TRUE
    killall Finder
  }

  hide_secret_files() {
    defaults write com.apple.finder AppleShowAllFiles FALSE
    killall Finder
  }

  ################################################################################
  # Java
  ################################################################################
  alias ls_java='/usr/libexec/java_home -V 2>&1 \
| grep -E "\d.\d.\d_\d\d" | cut -d , -f 1 | colrm 1 4 | grep -v Home'

  change_java() {
    export JAVA_HOME="$(/usr/libexec/java_home -v "$1")"
    export PATH="${JAVA_HOME}/bin:${PATH}"
    java -version
  }

  ################################################################################
  # Misc
  ################################################################################
  alias mongod="mongod --config /usr/local/etc/mongod.conf"
  alias nw="/Applications/nwjs.app/Contents/MacOS/nwjs"

  brew_update() {
    brew update
    brew upgrade
    brew cleanup
  }

  emw() {
    local bin="/Applications/Emacs.app/Contents/MacOS/Emacs"
    ${bin} "$@" &
  }
fi
