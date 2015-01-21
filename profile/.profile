[[ -f "${HOME}/.osxprofile" ]] && source "${HOME}/.osxprofile"
[[ -f "${HOME}/.localprofile" ]] && source "${HOME}/.localprofile"

if [[ -n "${SSH_TTY}" ]]; then
  if [[ -f "${HOME}/.zshrc" ]]; then
    source "${HOME}/.zshrc"
  else
    if [[ -f "${HOME}/.bashrc" ]]; then
      source "${HOME}/.bashrc"
    end
  end
fi
