# Start tmux:
tmux

# Detach from tmux:
Ctrl-b d

# Restore tmux session:
tmux attach

# Detach an already attached session (great if you are moving devices with different screen resolutions)
tmux attach -d

# Display session:
tmux ls

# Rename session:
Ctrl-b $

# Switch session:
Ctrl-b s

# Start a shared session:
tmux -S /tmp/your_shared_session
chmod 777 /tmp/your_shared_session

# Help screen (Q to quit):
Ctrl-b ?

# Scroll in window:
Ctrl-b PageUp/PageDown

# Reload configuation file
Ctrl-b : source-file /path/to/file

# Window management
# =================

# Create window:
Ctrl-b c

# Destroy window:
Ctrl-b x

# Switch between windows:
Ctrl-b [0-9]
or
Ctrl-b Arrows

# Split windows horizontally:
Ctrl-b %

# Split windows vertically:
Ctrl-b "

# view messages
Ctrl-c ~

# rename window
Ctrl-c ,

# This assumes that you've hit ctrl + b and : to get to the command prompt
:resize-pane -L

# (Resizes the current pane down)
:resize-pane -D

# (Resizes the current pane upward)
:resize-pane -U

# (Resizes the current pane left)
:resize-pane -L

# (Resizes the current pane right)
:resize-pane -R

# (Resizes the current pane down by 10 cells)
:resize-pane -D 10

# (Resizes the current pane upward by 10 cells)
:resize-pane -U 10

# (Resizes the current pane left by 10 cells)
:resize-pane -L 10

# (Resizes the current pane right by 10 cells)
:resize-pane -R 10

# Show all current options
tmux show-options -g

# Show all current window options
tmux show-options -w

# Show all current server options
tmux show-options -s
