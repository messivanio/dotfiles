#!/bin/bash

export BASH_DIR=~/dotfiles/bash

. $BASH_DIR/variables
. $BASH_DIR/alias
. $BASH_DIR/prompt
. $BASH_DIR/functions

case $(uname) in
  'Linux')
		BASH_COMPLETION_DIR=/etc/bash_completion 
		export CHRUBY_DIR='/usr/local/share/chruby' 
	;;
  'Darwin')
		BASH_COMPLETION_DIR=$(brew --prefix)/etc/bash_completion 
		export CHRUBY_DIR='/usr/local/opt/chruby/share/chruby'
	;;
esac

source $CHRUBY_DIR/chruby.sh
source $CHRUBY_DIR/auto.sh

chruby ruby-2.2.3

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

if [ -f $BASH_COMPLETION_DIR ]; then
	. $BASH_COMPLETION_DIR
else
	echo "Please install bash-completion"
fi