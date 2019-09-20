#!/bin/bash
github_black="#76787b"
github_blue="#032f62"
github_yellow="#e36209"
github_red="#b31d28"
github_white="#24292e"
github_green="#22863a"
github_visual_grey="#3e4452"
github_comment_grey="#5c6370"

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

set "message-fg" "$github_white"
set "message-bg" "$github_black"

set "message-command-fg" "$github_white"
set "message-command-bg" "$github_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$github_black"
setw "window-status-bg" "$github_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$github_black"
setw "window-status-activity-fg" "$github_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$github_comment_grey"
set "window-active-style" "fg=$github_white"

set "pane-border-fg" "$github_white"
set "pane-border-bg" "$github_black"
set "pane-active-border-fg" "$github_green"
set "pane-active-border-bg" "$github_black"

set "display-panes-active-colour" "$github_yellow"
set "display-panes-colour" "$github_blue"

set "status-bg" "$github_black"
set "status-fg" "$github_white"

time_format=$(get "@github_time_format" "%R")
date_format=$(get "@github_date_format" "%m-%d")

set "@prefix_highlight_fg" "$github_visual_grey"
set "@prefix_highlight_bg" "$github_yellow"
set "@prefix_highlight_copy_mode_attr" "fg=$github_visual_grey,bg=$github_yellow"
set "@prefix_highlight_output_suffix" " » "

set "status-right" "#[fg=$github_blue,bg=$github_visual_grey] « #[fg=$github_visual_grey,bg=$github_blue] ${date_format} ${time_format} "
set "status-left" "#[fg=$github_visual_grey,bg=$github_red] #S #[fg=$github_red,bg=$github_visual_grey] » #[fg=$github_green,bg=$github_visual_grey]#{prefix_highlight}"

set "window-status-format" "#[fg=$github_green,bg=$github_visual_grey] #I #W "
set "window-status-current-format" "#[fg=$github_visual_grey,bg=$github_green,bold] #I #W "

