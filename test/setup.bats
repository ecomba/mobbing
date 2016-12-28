#!/usr/bin/env bats

load helper

@test "Sets the group email domain" {
  set_group_mail "crafters@8thlight.com"

  [ "$(<~/.mob/groupmail)" = "8thlight.com" ]
}

@test "Overwrites the group email domain with a new one" {
  set_group_mail "crafters@8thlight.com"
  set_group_mail "devs@7thlight.com"

  [ "$(<~/.mob/groupmail)" = "7thlight.com" ]
}

@test "Reads the group email" {
  set_group_mail "crafters@8thlight.com"

  [ "$(group_mail)" = "8thlight.com" ]
}
