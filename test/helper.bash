. lib/mob.bash

setup() {
  create_mobbing_home
}

teardown() {
 rm -rf $MOBBING_HOME
}
