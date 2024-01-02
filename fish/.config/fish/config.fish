if status is-interactive
	starship init fish | source
end

set -gx EDITOR nvim

abbr --add gc 'git commit'
abbr --add gst 'git status'
abbr --add ga 'git add'
abbr --add gco 'git checkout'
abbr --add gp 'git pull'

