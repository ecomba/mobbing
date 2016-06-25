#!/usr/bin/env bats

load helper

@test "Sets the group email" {
  set_group_mail "crafters@8thlight.com"

  [ "$(<~/.mob/groupmail)" = "crafters@8thlight.com" ]
}

@test "Overwrites the group email with a new one" {
  set_group_mail "crafters@8thlight.com"
  set_group_mail "devs@8thlight.com"

  [ "$(<~/.mob/groupmail)" = "devs@8thlight.com" ]
}

@test "Reads the group email" {
  set_group_mail "crafters@8thlight.com"

  [ "$(group_mail)" = "crafters@8thlight.com" ]
}
