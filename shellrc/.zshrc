export ZSH="${HOME}/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git jump osx ruby)
source "${ZSH}/oh-my-zsh.sh"

_completemarks {
  reply=($(ls $MARKPATH))
}

compctl -K _completemarks jump
compctl -K _completemarks unmark

setopt no_nomatch
setopt interactivecomments

[[ -e "${HOME}/.bashrc" ]] && emulate sh -c 'source "${HOME}/.bashrc"'
