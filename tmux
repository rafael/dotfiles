# Use vim keybindings in copy mode
setw -g mode-keys vi

# Setup 'v' to begin selection as in Vim
# bind-key -t vi-copy v begin-selection
# bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

############################################################################
# Reset Prefix
############################################################################
set -g prefix C-a
bind-key a send-prefix # for nested tmux sessions

############################################################################
# Global options
############################################################################
# large history
set-option -g history-limit 10000

# colors
set-option -g default-terminal "screen-256color" #"xterm-256color" # "screen-256color"



# basic settings
set-window-option -g xterm-keys on # for vim
set-window-option -g mode-keys vi # vi key
set-window-option -g monitor-activity on

# Automatically set window title
setw -g automatic-rename

# use mouse # More on mouse support
setw -g mouse on

# vi movement keys
# set-option -g status-keys vi

############################################################################
# Status Bar
############################################################################
set-option -g status-justify right
set-option -g status-bg black # colour213 # pink
set-option -g status-fg cyan
set-option -g status-interval 5
set-option -g status-left-length 30
set-option -g status-left '#[fg=magenta]» #[fg=blue,bold]#T#[default]'
set-option -g status-right '#[fg=red,bold][[ #(git branch) branch ]] #[fg=cyan]»» #[fg=blue,bold]###S #[fg=magenta]%R %m-%d#(acpi | cut -d ',' -f 2)#[default]'
set-option -g visual-activity on


# Titles (window number, program name, active (or not)
set-option -g set-titles on
set-option -g set-titles-string '#H:#S.#I.#P #W #T'

############################################################################
# Bindings
############################################################################
# reload tmux conf
bind-key r source-file ~/.tmux.conf

############################################################################
# panes
############################################################################
# Navigation ---------------------------------------------------------------
# use the vim motion keys to move between panes
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

# Resizing ---------------------------------------------------------------
bind-key C-h resize-pane -L
bind-key C-j resize-pane -D
bind-key C-k resize-pane -U
bind-key C-l resize-pane -R

# Start windows and panes at 1, not 0
set -g base-index 1
set -g pane-base-index 1

# Windows and panes start at the current directory.
bind-key c new-window -c "#{pane_current_path}"
bind-key % split-window -h -c "#{pane_current_path}"
bind-key '"' split-window -c "#{pane_current_path}"

# use vim motion keys while in copy mode
setw -g mode-keys vi

# Powerline
# source "/usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf"
######################
### DESIGN CHANGES ###
######################


## Status bar design
# status line
set -g status-justify left
set -g status-bg default
set -g status-fg colour12
set -g status-interval 2

# window status
setw -g window-status-format " #F#I:#W#F "
setw -g window-status-current-format " #F#I:#W#F "
setw -g window-status-format "#[fg=magenta]#[bg=black] #I #[bg=cyan]#[fg=colour8] #W "
setw -g window-status-current-format "#[bg=brightmagenta]#[fg=colour8] #I #[fg=colour8]#[bg=colour14] #W "

# Info on left (I don't have a session display for now)
set -g status-left ''

# loud or quiet?
set-option -g visual-activity off
set-option -g visual-bell off
set-option -g visual-silence off
set-window-option -g monitor-activity off
set-option -g bell-action none

set -g default-terminal "screen-256color"

# The modes {
setw -g clock-mode-colour colour135

# }
# The panes {

# }
# The statusbar {

set -g status-position bottom
set -g status-bg colour234
set -g status-fg colour137
set -g status-left ''
set -g status-right '#[fg=colour233,bg=colour241,bold] %d/%m #[fg=colour233,bg=colour245,bold] %H:%M:%S '
set -g status-right-length 50
set -g status-left-length 20

setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour50]#F '

setw -g window-status-format ' #I#[fg=colour237]:#[fg=colour250]#W#[fg=colour244]#F '


# }
# The messages {


# }

# List of plugins
# Supports `github_username/repo` or full git repo URLs
set -g @tpm_plugins '              \
  tmux-plugins/tpm                 \
  tmux-plugins/tmux-sensible       \
'
# Other examples:
# github_username/plugin_name    \
# git@github.com/user/plugin     \
# git@bitbucket.com/user/plugin  \

# Initializes TMUX plugin manager.
# Keep this line at the very bottom of tmux.conf.
run-shell '~/.tmux/plugins/tpm/tpm'
