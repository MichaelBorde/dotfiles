################################################################################
# ZSH
################################################################################
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(gitfast jump ruby docker node npm web-search)

if [[ "$(uname)"=="Darwin" ]]; then
  plugins+=(osx)
fi

source "${ZSH}/oh-my-zsh.sh"

setopt no_nomatch
setopt interactivecomments

################################################################################
# Aliases
################################################################################
alias ls="ls -p"
alias ll="ls -lhp"
alias be="bundle exec"
alias tmuxa="tmux a -t 0"
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias enip='ifconfig | grep -Eo "inet (addr:)?([0-9]*\.){3}[0-9]*" | grep -Eo "([0-9]*\.){3}[0-9]*" | grep -v "127.0.0.1"'
alias es="emacs --daemon"
alias em="emacsclient -t"
alias uuid="uuidgen | tr '[:upper:]' '[:lower:]'"
alias compose="docker-compose"
alias rn="react-native"

if [[ "$(uname)"=="Darwin" ]]; then
  alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
  alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
fi

################################################################################
# .zshrc
################################################################################
alias edit_profile="${EDITOR} ${HOME}/.zshrc"
alias resource_profile="source ${HOME}/.zprofile && source ${HOME}/.zshrc"

################################################################################
# Docker
################################################################################
docker_stop_containers() {
  docker stop $(docker ps -a -q)
}

docker_clean() {
  docker_clean_containers
  docker_clean_images
  docker_clean_volumes
}

docker_clean_containers() {
  docker rm -v $(docker ps -a -q -f status=exited)
}

docker_clean_images() {
  docker rmi $(docker images -f "dangling=true" -q)
}

docker_clean_volumes() {
  docker volume rm $(docker volume ls -qf dangling=true)
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

################################################################################
# Kubernetes
################################################################################
kube_log() {
  local pod="$1"
  kubectl logs "$(kubectl get pods | grep -m 1 -o "${pod}[^ ]*")" "${@:2}"
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
  "${HOME}/.rvm/scripts/rvm"
fi
export PATH="$PATH:${HOME}/.rvm/bin"

################################################################################
# JavaScript
################################################################################
npm_install_global_packages() {
  local -a packages
  packages=("npm" "grunt-cli" "http-server" "npm-check" "ionic" "cordova" \
"ios-deploy" "ios-sim" "knex" "react-native-cli" "prettier")
  npm install -g  "${packages[@]}"
}

if [[ -s "${HOME}/.nvm/nvm.sh" ]]; then
  source  "${HOME}/.nvm/nvm.sh"
fi

################################################################################
# Java
################################################################################
if [[ "$(uname)"=="Darwin" ]]; then
   alias ls_java='/usr/libexec/java_home -V 2>&1 \
         | grep -E "\d.\d.\d_\d\d" | cut -d , -f 1 | colrm 1 4 | grep -v Home'

   change_java() {
     export JAVA_HOME="$(/usr/libexec/java_home -v "$1")"
     export PATH="${JAVA_HOME}/bin:${PATH}"
     java -version
   }
fi

################################################################################
# Misc
################################################################################
add_timestamp() {
  local file="$1"
  local timestamp="$(date +"%Y%m%d%H%M%S")"
  local without_ext="${file%%.*}"
  local ext="${file#*.}"
  mv "${file}" "${without_ext}-${timestamp}.${ext}"
}

tabs_to_spaces() {
  local types="$1"
  find . -name "$1" ! -type d -exec \
    bash -c 'expand -t 2 "$0" > /tmp/e && mv /tmp/e "$0"' {} \;
}

if [[ "$(uname)"=="Darwin" ]]; then
  brew_update() {
    brew update
    brew upgrade
    brew cleanup
  }
fi

resize_images() {
  local file
  while read file; do
    echo "Resizing ${file}"
    convert "${file}" -resize "2000000@>" "${file}"
  done < <(find . -maxdepth 1 -iname "*.jpg" -o -iname "*.png")
}

################################################################################
# System
################################################################################
ulimit -n 65536
ulimit -u 2048
