if [[ "$(uname)" == "Darwin" ]]; then
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home
  export GROOVY_HOME=/usr/local/opt/groovy/libexec
  export GRADLE_HOME=/usr/local/opt/gradle
  export MAVEN_OPTS="-Xmx1024m -Xms512m -Dfile.encoding=UTF8"
  export ANT_OPTS="-Xmx1024m -Xms512m -Dfile.encoding=UTF8"
  export ANDROID_HOME="/usr/local/opt/android"
  export MONO_GAC_PREFIX="/usr/local"
  export RUBY_VERSION=2.3.3
  
  export PATH="\
${HOME}/.rvm/gems/ruby-${RUBY_VERSION}/bin:\
${HOME}/.rvm/bin:\
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

export EDITOR="emacs"
export ALTERNATE_EDITOR="nano"
export VISUAL="${EDITOR}"
export CLICOLOR="1"
export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"

if [[ -f "${HOME}/.localprofile" ]]; then
  source "${HOME}/.localprofile"
fi
