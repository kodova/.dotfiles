# Set black background for the status bar
set -g status-bg black

# Set default text color to white for better visibility
set -g status-fg white

# Define segments for the right side of the status bar
set -g status-right-length 60
set -g status-right "#[fg=yellow,bg=black]#(pwd) #[fg=white]#[bg=red]#(date +%H:%M %Z)"

