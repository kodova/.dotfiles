if status is-interactive
	starship init fish | source
	
	abbr --add gc 'git commit'
	abbr --add gst 'git status'
	abbr --add ga 'git add'
	abbr --add gco 'git checkout'
	abbr --add gp 'git pull'

	if test -d $HOME/go/bin
		fish_add_path $HOME/go/bin
	end

end

set -gx EDITOR nvim
set -gx GOPRIVATE "github.com/geniusmonkey/*"


