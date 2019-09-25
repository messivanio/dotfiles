#!/bin/bash

export BASH_DIR=~/dotfiles/bash

. $BASH_DIR/variables
. $BASH_DIR/alias

if [[ $- == *i* ]]
then
  . $BASH_DIR/prompt
fi

. $BASH_DIR/functions

case $(uname) in
  'Linux')
		BASH_COMPLETION_DIR=/etc/bash_completion 
	;;
  'Darwin')
		BASH_COMPLETION_DIR=$(brew --prefix)/etc/bash_completion 
	;;
esac

if [ -f $BASH_COMPLETION_DIR ]; then
	. $BASH_COMPLETION_DIR
else
	echo "Please install bash-completion"
fi

. $BASH_DIR/complete
