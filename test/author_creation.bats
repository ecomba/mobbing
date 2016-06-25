#!/usr/bin/env bats

load helper

@test "Creates an author" {
  add_author "ecomba" "Enrique Comba Riepenhausen"

  [ "$(<~/.mob/authors)" = "ecomba:Enrique Comba Riepenhausen" ]
}

@test "Returns an authors name" {
  add_author "ecomba" "Enrique Comba Riepenhausen"
  add_author "cgockel" "Christoph Gockel"

  [ "$(author_name 'cgockel')" = "Christoph Gockel" ]
}

@test "Returns an authors email" {
  set_group_mail "crafters@8thlight.com"
  add_author "ecomba" "Enrique Comba Riepenhausen"

  [ "$(author_email 'ecomba')" = "ecomba" ]
}
