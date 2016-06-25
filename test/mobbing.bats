#!/usr/bin/env bats

load helper

@test "Adds an author to the git authors list" {
  set_group_mail "crafters@8thlight.com"
  add_author "ecomba" "Enrique Comba Riepenhausen"

  add_pairing_author "ecomba"

  [ "$__git_author_names" = " and Enrique Comba Riepenhausen" ]
  [ "$__git_author_emails" = "ecomba+" ]
}

@test "Adds two authors to the git author list" {
  set_group_mail "crafters@8thlight.com"
  add_author "ecomba" "Enrique Comba Riepenhausen"
  add_author "cgockel" "Christoph Gockel"

  add_pairing_author "ecomba"
  add_pairing_author "cgockel"

  [ "$__git_author_names" = " and Enrique Comba Riepenhausen and Christoph Gockel" ]
  [ "$__git_author_emails" = "ecomba+cgockel+" ]
}


@test "Sets up a pair" {
  set_group_mail "crafters@8thlight.com"

  add_author "cgockel" "Christoph Gockel"
  add_author "ecomba" "Enrique Comba Riepenhausen"

  do_the_mob "cgockel" "ecomba"

  [ "$GIT_AUTHOR_NAME" = "Christoph Gockel and Enrique Comba Riepenhausen" ]
  [ "$GIT_AUTHOR_EMAIL" = "cgockel+ecomba+crafters@8thlight.com" ]
}
