#!/bin/bash

github_black="#24292e"
github_yellow="#df5f11"
github_white="#feffff"
github_green="#22863a"
github_visual_grey="#41484f"
github_light_grey="#eceef1"
github_light_blue="#aedaf7"

time_format="%R"
date_format="%Y-%m-%d"

tmux set-option -gq status "on"
tmux set-option -gq status-justify "left"

tmux set-option -gq status-left-length "100"
tmux set-option -gq status-right-length "100"
tmux set-option -gq status-right-attr "none"

tmux set-option -gq message-style "bg=$github_light_grey,fg=$github_black"
tmux set-option -gq message-command-style "bg=$github_white,fg=$github_black"

tmux set-option -gq status-attr "none"
tmux set-option -gq status-left-attr "none"
tmux set-option -gq status-style "bg=$github_light_grey,fg=$github_black"

tmux set-option -gq pane-border-style "fg=$github_light_grey"
tmux set-option -gq pane-active-border-style "fg=$github_black"

tmux set-window-option -gq mode-style "bg=$github_light_blue"

tmux set-window-option -gq window-status-fg $github_black
tmux set-window-option -gq window-status-bg $github_light_grey
tmux set-window-option -gq window-status-attr "none"
tmux set-window-option -gq window-status-activity-bg $github_black
tmux set-window-option -gq window-status-activity-fg $github_white
tmux set-window-option -gq window-status-activity-attr "none"
tmux set-window-option -gq window-status-separator ""

tmux set-option -gq @prefix_highlight_fg "$github_white"
tmux set-option -gq @prefix_highlight_bg "$github_yellow"
tmux set-option -gq @prefix_highlight_copy_mode_attr "bg=$github_yellow,fg=$github_visual_grey"
tmux set-option -gq @prefix_highlight_output_prefix "« "
tmux set-option -gq @prefix_highlight_output_suffix " "

tmux set-option -gq status-right "#{prefix_highlight}#[fg=$github_visual_grey,bg=$github_light_grey]«#[fg=$github_light_grey,bg=$github_visual_grey] ${date_format} ${time_format} #[fg=$github_black,bg=$github_visual_grey]«#[fg=$github_light_grey,bg=$github_black] #h "
tmux set-option -gq status-left "#[fg=$github_light_grey,bg=$github_yellow] #S #[fg=$github_visual_grey,bg=$github_light_grey]»"

tmux set-option -gq window-status-format "#[fg=$github_light_grey,bg=$github_visual_grey] #I » #W #[fg=$github_visual_grey,bg=$github_light_grey]»"
tmux set-option -gq window-status-current-format "#[fg=$github_light_grey,bg=$github_green,bold] #I » #W #[fg=$github_visual_grey,bg=$github_light_grey]»"
