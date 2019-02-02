# Create a name with the following format V8_5_0_20160120143012__some_description_here.sql
function sqlname() { 
  if [ $# -lt 2 ]; then
    echo "Usage: sqlname <version> <description>"
    echo "Example: sqlname 8.25.0 some description here" 
  else
    version=${1//\./_}
    ts=$(date "+%Y%m%d%H%M%S")
    shift
    desc=$(echo $@ | tr -s " " "_")
    echo -n "V${version}_${ts}__${desc}.sql" | tee >(pbcopy)
    echo
  fi
}
