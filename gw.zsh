function gw() {
  GW="$(upfind gradlew)"
  if [ -z "$GW" ]; then
    echo "Gradle wrapper not found."
  else
    caffeinate -d -i -m $GW $@
  fi
}
