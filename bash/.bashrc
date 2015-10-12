#!/bin/bash

export LC_ALL=pt_BR.UTF-8
export LC_CTYPE=pt_BR.UTF-8
export LANG=pt_BR.UTF-8
export BASH_DIR=~/dotfiles/bash

. $BASH_DIR/alias
. $BASH_DIR/prompt
. $BASH_DIR/variables

source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
