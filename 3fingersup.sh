#!/bin/bash
#by antoniomcr96 https://github.com/antoniomcr96/scripts-for-libinput-gestures

activewindow=$(xdotool getActiveWindow)

if test -z "$activewindow"; 			#workaround to test if no window is focused
	then xdotool set_desktop --relative -- 1; #switch workspace
	xdotool windowfocus "Desktop"; 	#unfocus window on next workspace to keep scrolling
	exit; 
fi;

status=$(xwininfo -id $activewindow -all | egrep "Maximized|Fullscreen" | wc -l) #returns "1" if maximized horizontally or vertically, "2" if maximized, "3" if fullscreen

if [ $status = "3" ]; 				#if window is fullscreen
	then xdotool key CONTROL+SUPER+0xff52; #bring it to upper workspace
elif [ $status = "2" ]; 			#if window is maximized
	then xdotool key SUPER+ALT+0xff52;	#toggle (set) fullscreen
else 
	xdotool key SUPER+0xff52;	 	#else maximize window
fi

exit
