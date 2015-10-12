#!/bin/bash

export BASH_DIR=~/dotfiles/bash

. $BASH_DIR/variables
. $BASH_DIR/alias
. $BASH_DIR/prompt

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
