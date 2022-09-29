
if test -e ~/.asdf/asdf.fish 
	source ~/.asdf/asdf.fish
	source ~/.asdf/completions/asdf.fish
end

set -U fish_greeting ""

#setxkbmap -model abnt -layout us -variant intl
setxkbmap -model abnt2 -layout br

if test -e ~/.config/fish/secrets.fish
	source ~/.config/fish/secrets.fish
end

set PATH $HOME/.cargo/bin $PATH

if test -e /home/linuxbrew/.linuxbrew/bin/brew
	eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
end

xgamma -gamma 0.65 -q
