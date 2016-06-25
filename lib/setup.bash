print_setup_header() {
  echo "################################################################################"
  echo "#   Welcome to mob!                                                            #"
  echo "#                                                                              #"
  echo "################################################################################"
}

setup_group_email() {
  echo "What is the group email? (i.e. dev@8thlight.com)"
  read group_email
  echo "You entered: $group_email is this correct?"
  select yn in "yes" "no" ; do
    case $yn in
      yes ) set_group_mail $group_email; exit;;
      no ) setup_group_email;;
    esac
  done
}

do_setup() {
  create_mobbing_home
  setup_group_email
}

setup() {
  echo ""
  print_setup_header
  echo ""
  echo "Do you wish to setup mob on your system?"
  select yn in "yes" "no" ; do
    case $yn in
      yes ) do_setup ; break;;
      no ) echo "Sorry to hear, have a great day!" ; exit;;
    esac
  done
}


