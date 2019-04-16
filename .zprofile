if [[ "$(uname)" == "Darwin" ]]; then
  export ANDROID_HOME="/usr/local/opt/android"
  export MONO_GAC_PREFIX="/usr/local"
  
export EDITOR="nano"
export ALTERNATE_EDITOR="emacs"
export VISUAL="${EDITOR}"
export CLICOLOR="1"
export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"
export DISABLE_UPDATE_PROMPT=true
export RAILS_ENV=test
export NVM_DIR="${HOME}/.nvm"
export NODE_VERSION=10.15.3
export MAVEN_OPTS="-Xmx1024m -Xms512m -Dfile.encoding=UTF8"
export ANT_OPTS="-Xmx1024m -Xms512m -Dfile.encoding=UTF8"

export PATH="\
${NVM_DIR}/versions/node/v${NODE_VERSION}/bin:\
/Applications/Postgres.app/Contents/Versions/latest/bin:\
/usr/local/sbin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/opt/X11/bin:\
/usr/local/MacGPG2/bin:\
${ANDROID_HOME}/tools:\
${ANDROID_HOME}/platform-tools"
fi

if [[ -f "${HOME}/.zprofile.local" ]]; then
  source "${HOME}/.zprofile.local"
fi
