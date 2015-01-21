[[ -f "${HOME}/.osxprofile" ]] && source "${HOME}/.osxprofile"
[[ -f "${HOME}/.localprofile" ]] && source "${HOME}/.localprofile"

if [[ -n "${SSH_TTY}" ]]; then
  [[ -n "${ZSH_VERSION}" && -f "${HOME}/.zshrc" ]] && source "${HOME}/.zshrc"
  [[ -n "${BASH_VERSION}" && -f "${HOME}/.bashrc" ]] && source "${HOME}/.bashrc"
fi
