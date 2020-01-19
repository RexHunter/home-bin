#!/bin/bash

#process_name="google-play-music-desktop-player"
process_name=$1
process_title=$2
script_name="${0:2}"

echo "${process_title}"

echo "${script_name}"
wraped_process_name="[${process_name:0:1}]${process_name:1}"
echo "${wraped_process_name}"

ps_result=$(ps aux | grep "${wraped_process_name}" | grep -v ${script_name} | wc -l) 

echo "${ps_result}"

if [ $ps_result -eq 0 ]; then
	i3-msg "exec --no-startup-id ${process_name}"
    i3-msg "exec [title=\"${process_title}\"] move scratchpad"
else
    i3-msg "[title=\"${process_title}\"] scratchpad show"
fi;
