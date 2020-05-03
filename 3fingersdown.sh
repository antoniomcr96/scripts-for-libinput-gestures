#!/bin/bash
#by antoniomcr96 https://github.com/antoniomcr96/scripts-for-libinput-gestures

activewindow=$(xdotool getActiveWindow)

if test -z "$activewindow"; 			#workaround to test if no window is focused
	then xdotool set_desktop --relative -- -1; #switch workspace
	xdotool windowfocus "Desktop"; #unfocus window on next workspace to keep scrolling
	exit; 
fi;

status=$(xwininfo -id $activewindow -all | egrep "Maximized|Fullscreen" | wc -l) #returns "1" if maximized horizontally or vertically, "2" if maximized, "3" if fullscreen

if [ $status = "3" ]; 				#if fullscreen
	then xdotool key SUPER+ALT+0xff52;	#toggle (remove) fullscreen
elif [ $status = "2" ] || [ $status = "1" ]; 	#if maximized or half maximized
	then xdotool key SUPER+0xff54; 	#reset window
else 
	xdotool key SUPER+ALT+0xff54; 	#else minimize window
fi
exit
