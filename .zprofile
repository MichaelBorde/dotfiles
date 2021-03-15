export EDITOR="nano"
export ALTERNATE_EDITOR="vi"
export VISUAL="${EDITOR}"
export CLICOLOR="1"
export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"
export DISABLE_UPDATE_PROMPT=true
export RAILS_ENV=test
export MAVEN_OPTS="-Xmx1024m -Xms512m -Dfile.encoding=UTF8"
export ANT_OPTS="-Xmx1024m -Xms512m -Dfile.encoding=UTF8"
export ANDROID_HOME="${HOME}/Android/Sdk"
export ANDROID_SDK="${HOME}/Android/Sdk"
export ANDROID_TOOLS_VERSION="29.0.2"
export ANDROID_NDK="${HOME}/Android/Ndk/r19c"
export PYENV_ROOT="${HOME}/.pyenv"
export RBENV_ROOT="${HOME}/.rbenv"

export PATH="\
${ANDROID_HOME}/tools:\
${ANDROID_HOME}/tools/bin:\
${ANDROID_HOME}/platform-tools:\
${ANDROID_HOME}/emulator:\
${ANDROID_HOME}/build-tools/${ANDROID_TOOLS_VERSION}:\
${PYENV_ROOT}/bin:\
${RBENV_ROOT}/bin:\
${HOME}/.bin:\
/usr/local/sbin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin" 


if [[ -f "${HOME}/.zprofile.local" ]]; then
  source "${HOME}/.zprofile.local"
fi
