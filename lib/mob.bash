#!/usr/bin/env bash
VERSION="0.1.0"

export MOBBING_HOME=~/.mob
export GROUP_MAIL=$MOBBING_HOME/groupmail
export AUTHORS=$MOBBING_HOME/authors
__git_author_names=""
__git_author_emails=""

mob_version() {
  echo $VERSION
}

create_mobbing_home() {
  mkdir $MOBBING_HOME
}

set_group_mail() {
  echo "$1" > $GROUP_MAIL
}

group_mail() {
  echo $(<$GROUP_MAIL)
}

add_author() {
  echo "$1:$2" >> $AUTHORS
}

author_name() {
  while read line
  do
    IFS=':' ; author=($line) ; IFS=' '
    if [ "$1" = "${author[0]}" ]; then
      echo "${author[1]}"
    fi
  done < $AUTHORS
}

author_email() {
  while read line
  do
    IFS=':' ; author=($line) ; IFS=' '
    if [ "$1" = "${author[0]}" ]; then
      echo "${author[0]}"
    fi
  done < $AUTHORS
}

add_pairing_author() {
  eval "__git_author_names='$__git_author_names and $(author_name $1)'"
  eval "__git_author_emails='$__git_author_emails$(author_email $1)+'"
}

setup_current_mob() {

  author_names="export GIT_AUTHOR_NAME='${__git_author_names:5}'"
  author_emails="export GIT_AUTHOR_EMAIL='${__git_author_emails}$(group_mail)'"

  echo $author_emails > $MOBBING_HOME/current_mob
  echo $author_names >> $MOBBING_HOME/current_mob

  export GIT_AUTHOR_NAME="${__git_author_names:5}"
  export GIT_AUTHOR_EMAIL="${__git_author_emails}$(group_mail)"
}

do_the_mob() {
  for author in $@
  do
    add_pairing_author $author
  done
  
  setup_current_mob
}

