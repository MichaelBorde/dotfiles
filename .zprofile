export EDITOR="nano"
export ALTERNATE_EDITOR="emacs"
export VISUAL="${EDITOR}"
export CLICOLOR="1"
export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"
export DISABLE_UPDATE_PROMPT=true
export RAILS_ENV=test
export NVM_DIR="${HOME}/.nvm"
export NODE_VERSION=10.16.3
export MAVEN_OPTS="-Xmx1024m -Xms512m -Dfile.encoding=UTF8"
export ANT_OPTS="-Xmx1024m -Xms512m -Dfile.encoding=UTF8"
export ANDROID_HOME="${HOME}/Android/Sdk"

export PATH="\
${NVM_DIR}/versions/node/v${NODE_VERSION}/bin:\
${ANDROID_HOME}/tools:\
${ANDROID_HOME}/platform-tools:\
${ANDROID_HOME}/emulator:\
${ANDROID_HOME}/tools:\
${ANDROID_HOME}/tools/bin:\
${ANDROID_HOME}/platform-tools:\
/usr/local/sbin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin" 


if [[ -f "${HOME}/.zprofile.local" ]]; then
  source "${HOME}/.zprofile.local"
fi
