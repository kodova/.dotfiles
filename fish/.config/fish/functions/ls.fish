function ls
if command -sq exa
exa -al --color=always --group-directories-first --icons $argv
else
ls $argv
end
end
