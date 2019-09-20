#!/bin/bash
github_black="#24292e"
github_blue="#032f62"
github_yellow="#df5f11"
github_white="#ffffff"
github_green="#22863a"
github_visual_grey="#41484f"
github_light_grey="#eceef1"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$github_black"
set "message-bg" "$github_white"

set "message-command-fg" "$github_black"
set "message-command-bg" "$github_white"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$github_black"
setw "window-status-bg" "$github_light_grey"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$github_black"
setw "window-status-activity-fg" "$github_white"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$github_light_grey"
set "window-active-style" "fg=$github_black"

set "pane-border-fg" "$github_black"
set "pane-border-bg" "$github_white"
set "pane-active-border-fg" "$github_black"
set "pane-active-border-bg" "$github_white"

set "display-panes-active-colour" "$github_black"
set "display-panes-colour" "$github_blue"

set "status-bg" "$github_light_grey"
set "status-fg" "$github_black"

time_format=$(get "@github_time_format" "%R")
date_format=$(get "@github_date_format" "%m-%d")

set "@prefix_highlight_fg" "$github_white"
set "@prefix_highlight_bg" "$github_yellow"
set "@prefix_highlight_copy_mode_attr" "fg=$github_visual_grey,bg=$github_yellow"
set "@prefix_highlight_output_suffix" " » "

set "status-right" "#[fg=$github_white,bg=$github_visual_grey] « #[fg=$github_white,bg=$github_black] ${date_format} ${time_format} "
set "status-left" "#[fg=$github_white,bg=$github_yellow] #S #[fg=$github_yellow,bg=$github_visual_grey] » #{prefix_highlight}"

set "window-status-format" "#[fg=$github_white,bg=$github_visual_grey] #I #W "
set "window-status-current-format" "#[fg=$github_white,bg=$github_black,bold] #I #W "

