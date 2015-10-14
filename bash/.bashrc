#!/bin/bash

export BASH_DIR=~/dotfiles/bash

. $BASH_DIR/variables
. $BASH_DIR/alias
. $BASH_DIR/prompt

case $(uname) in
  'Linux')  export CHRUBY_DIR='/usr/local/share/chruby' ;;
  'Darwin') export CHRUBY_DIR='/usr/local/opt/chruby/share/chruby' ;;
esac

source $CHRUBY_DIR/chruby.sh
source $CHRUBY_DIR/auto.sh
