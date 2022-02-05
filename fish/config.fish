
if test -e ~/.asdf/asdf.fish 
	source ~/.asdf/asdf.fish
	source ~/.asdf/completions/asdf.fish
end

set -U fish_greeting "🐟"

setxkbmap -model abnt -layout us -variant intl

if test -e ~/.config/fish/secrets.fish
	source ~/.config/fish/secrets.fish
end