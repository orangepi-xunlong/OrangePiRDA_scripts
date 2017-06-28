#!/bin/bash

is_ubuntu() {
  uname -a > .tmp

  if grep -q Ubuntu .tmp; then
    rm .tmp
    return 0
  else
    rm .tmp
    return 1
  fi
}
