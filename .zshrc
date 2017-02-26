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

################################################################################
# .zshrc
################################################################################
alias edit-profile="${EDITOR} ${HOME}/.zshrc"
alias resource-profile="source ${HOME}/.zprofile && source ${HOME}/.zshrc"

################################################################################
# Docker
################################################################################
docker-stop-containers() {
  docker stop $(docker ps -a -q)
}

docker-clean() {
  docker-clean-containers
  docker-clean-images
  docker-clean-volumes
}

docker-clean-containers() {
  docker rm -v $(docker ps -a -q -f status=exited)
}

docker-clean-images() {
  docker rmi $(docker images -f "dangling=true" -q)
}

docker-clean-volumes() {
  docker volume rm $(docker volume ls -qf dangling=true)
}

docker-run-bash() {
  local image="$1"
  shift 1
  docker run -ti --name "${image}" "${image}" bash "$@"
}

docker-exec-bash() {
  local container="$1"
  shift 1
  docker exec -ti --name "${container}" "${container}" bash "$@"
}

docker-run-daemon() {
  local image="$1"
  shift 1
  docker run -d --name "${image}" "$@" "${image}"
}

docker-ip() {
  docker inspect -f "{{.NetworkSettings.IPAddress}}" "$1"
}

################################################################################
# Kubernetes
################################################################################
kube-log() {
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
install-global-packages() {
  local -a packages
  packages=("grunt-cli" "http-server" "npm-check" "ionic" "cordova" \
"ios-deploy" "ios-sim" "knex")
  npm install -g  "${packages[@]}"
}

if [[ -s "${HOME}/.nvm/nvm.sh" ]]; then
  source  "${HOME}/.nvm/nvm.sh"
fi

################################################################################
# Java
################################################################################
if [[ "$(uname)"=="Darwin" ]]; then
   alias ls-java='/usr/libexec/java_home -V 2>&1 \
         | grep -E "\d.\d.\d_\d\d" | cut -d , -f 1 | colrm 1 4 | grep -v Home'

   change-java() {
     export JAVA_HOME="$(/usr/libexec/java_home -v "$1")"
     export PATH="${JAVA_HOME}/bin:${PATH}"
     java -version
   }
fi

################################################################################
# Misc
################################################################################
add-timestamp() {
  local file="$1"
  local timestamp="$(date +"%Y%m%d%H%M%S")"
  local without_ext="${file%%.*}"
  local ext="${file#*.}"
  mv "${file}" "${without_ext}-${timestamp}.${ext}"
}

tabs-to-spaces() {
  local types="$1"
  find . -name "$1" ! -type d -exec \
    bash -c 'expand -t 2 "$0" > /tmp/e && mv /tmp/e "$0"' {} \;
}

if [[ "$(uname)"=="Darwin" ]]; then
  brew-update() {
    brew update
    brew upgrade
    brew cleanup
  }
fi

resize-images() {
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
