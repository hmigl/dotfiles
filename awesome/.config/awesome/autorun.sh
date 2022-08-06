#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run lxsession
run picom
run remaps
run nitrogen --restore
# run sxhkd
