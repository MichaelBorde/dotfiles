if [[ "$(uname)" == "Darwin" ]]; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home
  export GROOVY_HOME=/usr/local/opt/groovy/libexec
  export GRADLE_HOME=/usr/local/opt/gradle
  export ANDROID_HOME="/usr/local/opt/android"
  export MONO_GAC_PREFIX="/usr/local"
  
  export PATH="\
${HOME}/.rvm/gems/ruby-${RUBY_VERSION}/bin:\
${HOME}/.rvm/bin:\
${NVM_DIR}/versions/node/v${NODE_VERSION}/bin:\
${JAVA_HOME}/bin:\
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

export EDITOR="nano"
export ALTERNATE_EDITOR="emacs"
export VISUAL="${EDITOR}"
export CLICOLOR="1"
export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"
export DISABLE_UPDATE_PROMPT=true
export RUBY_VERSION=2.3.3
export RAILS_ENV=test
export NVM_DIR="${HOME}/.nvm"
export NODE_VERSION=8.9.3
export MAVEN_OPTS="-Xmx1024m -Xms512m -Dfile.encoding=UTF8"
export ANT_OPTS="-Xmx1024m -Xms512m -Dfile.encoding=UTF8"

if [[ -f "${HOME}/.zprofile.local" ]]; then
  source "${HOME}/.zprofile.local"
fi
