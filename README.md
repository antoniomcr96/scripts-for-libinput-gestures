# scripts-for-libinput-gestures
> These are some scripts that assign to trackpad gestures (through libinput-gestures) commands based on window focused and its position/aspect.
You can see a preview of what it does here: https://www.reddit.com/r/Ubuntu/comments/gccawq/made_some_scripts_for_libinputgestures_to_control/

It's simply based on two files and some commands that have to be put to the configuration file of libinput-gestures.

# Install Libinput Gestures
Follow README in the repository https://github.com/bulletmark/libinput-gestures#libinput-gestures. Remember to install ```xdotool```. 
- Test if libinput-gestures works.
- You must have a trackpad that supports multitouch gestures.
- I highly suggest installing Gestures: https://gitlab.com/cunidev/gestures a minimal GUI App for libinput-gestures.

# Put the scripts somewhere
Download the two files (3fingersdown.sh, 3fingersup.sh) from this repository and put them somewhere (I put theme in a hidden folder inside /home). In this case we will put them in (create the folder ```.libinputgestures-scripts``` inside /home):
```
~/.libinputgestures-scripts/
```
Open terminal and type (for the access permissions I think, without it doesn't work)
```sh
chmod a+x ~/.libinputgestures-scripts/3fingersdown.sh
chmod a+x ~/.libinputgestures-scripts/3fingersup.sh
```
# Edit your custom configuration file 
Here is how to do it: https://github.com/bulletmark/libinput-gestures#configuration.

I highly suggest to do it using Gestures: https://gitlab.com/cunidev/gestures

- Set ```~/.libinputgestures-scripts/3fingersup.sh``` for three fingers swipe up;
- Set ```~/.libinputgestures-scripts/3fingersdown.sh``` for three fingers swipe down;
- Set ```xdotool key SUPER+0xff51``` for three fingers swipe left;
- Set ```xdotool key SUPER+0xff53``` for three fingers swipe right;
- Set ```xdotool key SUPER+0xff52``` for four fingers swipe up;
- Set ```xdotool key SUPER+0xff54``` for four fingers swipe down.

If you want to do it manually you have to create a file called ```libinput-gestures.conf``` in ```~/.config/``` (if you want to use it for your user) and put these lines:
```
# Swipe threshold (0-100)
swipe_threshold 0

# Gestures
gesture swipe up 3 ~/.libinputgestures-scripts/3fingersup.sh
gesture swipe down 3 ~/.libinputgestures-scripts/3fingersdown.sh
gesture swipe left 3 xdotool key SUPER+0xff51
gesture swipe right 3 xdotool key SUPER+0xff53
gesture swipe down 4 xdotool key control+SUPER+0xff54
gesture swipe up 4 xdotool key control+SUPER+0xff52
```
If you want to use it for all users you have to edit ```/etc/libinput-gestures.conf```. Read libinput-gestures guide for further informations.

# Set specific keyboard shortcuts to make the script work
You have to set some custom keyboard shortcuts because the script simulates those shortcuts with ```xdotool key``` command.
- Move (window) to upper workspace: Control + Super + Up
- Move (window) to lower workspace: Control + Super + Down
- Switch to upper workspace: Control + Up
- Switch to lower workspace: Control + Down
- Minimize window: Super + Alt + Down
- Fullscreen: Super + Alt + Up (F11 should still work)
It works on non-Macs computers, I don't know if control key on Macs works the same for xdotool.

You can also do it manually by typing this on terminal, it should work:
```sh
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Control><Super>Up', '<Control><Super><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Control><Super>Down', '<Control><Super><Alt>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Control>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Control>Up']"
gsettings set org.gnome.desktop.wm.keybindings minimize "['<Super><Alt>Down']"
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super><Alt>Up']"
```
# Why I use xdotool to simulate shortcut
The script can be edited and adapted to your personal shortcuts with some basic programming knowledge. You can also use direct commands (without simulating shortcuts) to maximize/minimize windows and so on. 
The reason why I simulate shortcuts is because at the beginning I used to do so. The shortcut are specific also for another reason:
1. If you press Ctrl and swipe three fingers up/down the window will be moved to upper/lower workspace no matter its position/aspect (only if you set first two shortcuts manually);
2. If you press Alt the window will be minimized no matter what.

# Other things
1. The **scripts are commented**. Code is VERY simple and who wants can easily edit it with some basic programming knowledge. 
2. I'm not an expert programmer and many things can be improved. **Feel free to give your contribution**;
3. I don't have a lot of free time, so I can't follow actively the project, solve issues or give help.
4. If gestures are sometimes detected sometimes not it doesn't depend on the script.
5. It would be cool to create a script that does what's explained in this readme. At the moment I don't have the time unfortunally.
