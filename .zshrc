################################################################################
# ZSH
################################################################################
export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(gitfast jump ruby docker npm gpg-agent)

if [[ "$(uname)"=="Darwin" ]]; then
  plugins+=(osx)
fi

source "${ZSH}/oh-my-zsh.sh"

setopt no_nomatch
setopt interactivecomments

ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;'

################################################################################
# Aliases
################################################################################
alias ls="ls -p"
alias ll="ls -lhp"
alias be="bundle exec"
alias tmuxa="tmux a -t 0"
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias enip='ifconfig | grep -Eo "inet (addr:)?([0-9]*\.){3}[0-9]*" | grep -Eo "([0-9]*\.){3}[0-9]*" | grep -v "127.0.0.1"'
alias uuid="uuidgen | tr '[:upper:]' '[:lower:]'"
alias shortuuid="uuid | sed 's/-//g'"
alias compose="docker-compose"
alias rn="react-native"
alias ctop="ctop -i"
alias curlb="curl -s -o /dev/null -w  '%{time_total}ms %{http_code}'"
alias npmlinked="find node_modules -type l -not -iwholename '*node_modules/.bin/*'"
alias timestamp="date +'%s'"
alias npmversion="node -p -e \"require('./package.json').version\""

################################################################################
# .zshrc
################################################################################
alias edit_profile="${EDITOR} ${HOME}/.zshrc"
alias resource_profile="source ${HOME}/.zprofile && source ${HOME}/.zshrc"

################################################################################
# Other .dotfiles
################################################################################
if [[ -f "${HOME}/.zshrc.local" ]]; then
  source "${HOME}/.zshrc.local"
fi

################################################################################
# JavaScript
################################################################################
if [[ -s "${HOME}/.nvm/nvm.sh" ]]; then
  source  "${HOME}/.nvm/nvm.sh"
fi
if [[ -s "${HOME}/.nvm/bash_completion" ]]; then
  source  "${HOME}/.nvm/bash_completion"
fi

################################################################################
# Ruby
################################################################################
if type rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi  

################################################################################
# Java
################################################################################
if [[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]]; then 
  source "${HOME}/.sdkman/bin/sdkman-init.sh"
fi  

################################################################################
# Python
################################################################################
if type pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi  

################################################################################
# Misc
################################################################################
gitrec() {
  find . \
    -not -iwholename '*node_modules*' \
    -name .git \
    -exec dirname {} \; \
    -execdir "$@" \; \
    -exec echo '' \;
}

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

run_ntimes() {
  local times=$1;
  shift;
  for i in {1..${times}}; do
    { $@ } || return $?
  done
}

generate_rsa_keypair() {
  local bits=${1:-2048}
  local private="$(mktemp private.XXX.pem)"
  openssl genrsa -out "${private}" ${bits} > /dev/null 2>&1
  local public="$(mktemp public.XXX.pem)"
  openssl rsa -in "${private}" -outform PEM -pubout -out "${public}" > /dev/null 2>&1
  cat "${private}" "${public}"
  rm "${private}" "${public}"
}

list_extensions() {
  local path="${1:-${PWD}}"
  find "${path}" -type f | sed -n 's/..*\.//p' | sort | uniq -c
}

reduce_pdf() {
  local file="$1"
  ghostscript -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="reduced_${file}" "${file}"
}

prepare_os() {
  if type prepare_os_$(uname) >/dev/null 2>&1; then
    prepare_os_$(uname)
  fi  
}

if [[ "$(uname)"=="Darwin" ]]; then
  prepare_os_Darwin() {
    defaults write com.apple.screencapture location ~/Downloads
    killall SystemUIServer  
  }
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/michael/Sources/eove/eo-toolkit/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/michael/Sources/eove/eo-toolkit/node_modules/tabtab/.completions/electron-forge.zsh