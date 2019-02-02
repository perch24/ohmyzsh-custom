function jhome () {
  tmp_java_home=$(/usr/libexec/java_home --failfast -v $@)
  if [[ $? == 0 ]]; then
    export JAVA_HOME="$tmp_java_home"
  fi
}

jhome 1.8
