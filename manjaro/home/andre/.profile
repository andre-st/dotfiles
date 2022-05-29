#
#  User environment variables
#

export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/chromium
export EDITOR=vim


# Bash command history with timestamps:
#
export HISTTIMEFORMAT="%F %T "
export HISTSIZE=1000000


# Networking:
#
export WAN_IF=wlp4s0


# Cursor shape: blinking pipe/ibeam instead of non-blinking block
echo -e "\033[5 q"
# echo -e -n "\x1b[\x30 q" # changes to blinking block
# echo -e -n "\x1b[\x31 q" # changes to blinking block also
# echo -e -n "\x1b[\x32 q" # changes to steady block
# echo -e -n "\x1b[\x33 q" # changes to blinking underline
# echo -e -n "\x1b[\x34 q" # changes to steady underline
# echo -e -n "\x1b[\x35 q" # changes to blinking bar
# echo -e -n "\x1b[\x36 q" # changes to steady bar
 


