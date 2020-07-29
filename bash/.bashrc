#!/bin/bash

export BASH_DIR=~/dotfiles/bash

. $BASH_DIR/variables
. $BASH_DIR/alias

if [[ $- == *i* ]]
then
  . $BASH_DIR/prompt
fi

. $BASH_DIR/functions

. $BASH_DIR/completion/.git-completion.bash

case $(uname) in
  'Linux')
		BASH_COMPLETION_DIR=/etc/bash_completion 
	;;
  'Darwin')
		BASH_COMPLETION_DIR=/usr/local/etc/bash_completion.d
	;;
esac

if [ -d $BASH_COMPLETION_DIR ]; then
	# . $BASH_COMPLETION_DIR
	[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
else
	echo "Please install bash-completion"
fi

. $BASH_DIR/complete
