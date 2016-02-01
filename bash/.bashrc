#!/bin/bash

export BASH_DIR=~/dotfiles/bash

. $BASH_DIR/variables
. $BASH_DIR/alias
. $BASH_DIR/prompt
. $BASH_DIR/functions

case $(uname) in
  'Linux')  export CHRUBY_DIR='/usr/local/share/chruby' ;;
  'Darwin') export CHRUBY_DIR='/usr/local/opt/chruby/share/chruby' ;;
esac

source $CHRUBY_DIR/chruby.sh
source $CHRUBY_DIR/auto.sh

chruby ruby-2.2.3

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
