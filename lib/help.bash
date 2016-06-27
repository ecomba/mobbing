_blank() {
  echo ""
}

print_help() {
  echo "Usage: mob [options] or mob <first pair username> <second pair username> <...>"
  _blank
  echo "Options:"
  _blank
  echo "* -a           (mob -a <username> \"<full name>\")"
  echo "               Adds a new author to the list of possible authors."
  echo "               Example: mob -a ecomba \"Enrique Comba Riepenhausen\""
  echo "* -h, --help   Prints this message"
  echo "* -v           Prints the current version number"
  _blank
}

print_author_added() {
  _blank
  echo "Added \"$1\" to the list of mobbing authors."
  _blank
}

print_current_mob() {
  _blank
  if [[ ! -e "$CURRENT_MOB" ]] ; then
    echo "You are not mobbing (or pairing) with anyone at the moment."
  else
    echo "The current mob is exported as follows:"
    echo $(<$CURRENT_MOB)
  fi
  _blank
}

print_version() {
  _blank
  echo "Mobbing v$(mob_version)"
  _blank
}
