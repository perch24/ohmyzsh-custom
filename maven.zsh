export MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"

function mvn() {
  cwd=$(pwd)
  # If in a worktree folder then add param to ignore maven git plugin.
  echo "${cwd}"
  if [ "${cwd#*worktree}" != "${cwd}" ]; then
    echo "***************************************************"
    echo "Ignoring git-commit-id plugin for worktree directory"
    echo "***************************************************"
    args="-Dmaven.gitcommitid.skip=true"
  fi
  caffeinate -i command mvn $args "$@"
}

alias fmvn="mvn -Dspotbugs.skip=true -Dmaven.javadoc.skip=true -Dcheckstyle.skip=true -DskipTests=true"
