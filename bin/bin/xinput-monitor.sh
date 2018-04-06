#!/bin/bash
# xinput-monitor - Runs commands when new input devices are connected to X.
# Useful to set the keyboard layout when an external keyboard is connected to a laptop.

# Written by Vítor De Araújo (http://inf.ufrgs.br/~vbuaraujo/).
# No copyright - this script is in public domain.

# 2013-02-09.

# How to use:
# - Use 'xinput-monitor -n' to discover the device names of your keyboards;
# - Change the 'case' command below as appropriate for your configuration;
# - Put this script to run when yout X session starts
#   (by adding something like
#
#       ~/bin/xinput-monitor &
#
#    to your ~/.xinitrc, ~/.xsession, or other X session init file).


[[ $DISPLAY == :* ]] || { echo "Oops, remote display?" >&2; }
display="${DISPLAY##*:}"
display="${display%%.*}"

logfile="/var/log/Xorg.$display.log"

tail -n +1 -f "$logfile" |
	sed -une 's/.*XINPUT: Adding extended input device "\([^"]*\)" (type: \([^)]*\)).*/\2\t\1/p' |
	while IFS=$'\t' read type name; do

		echo "Device detected: $name"
		[[ $1 = -n ]] && continue

		device_ids="$(xinput list | sed -n "s|.*↳ $name *\tid=\([^\t]*\)\t.*|\1|p")"
		for id in $device_ids; do

			# Commands for each type of keyboard.
			case "$name" in
				# Ignore non-keyboard devices.
				'Power Button'|'Video Bus'|'Integrated Webcam'|*'Synaptics'*) continue 2 ;;

				'AT Translated Set 2 keyboard') setxkbmap -device "$id" us intl ;;
				'Some weird keyboard')          setxkbmap -device "$id" is ;;
				*)                              setxkbmap -device "$id" br abnt2 ;;
			esac

		done

		# Commands common to all keyboard types (uncomment or add your own).
		#xmodmap ~/.xmodmaprc     # keymap modifications
		#xset r rate 250          # keyboard repeat rate
		#xkbset exp =m            # "MouseKeys" expiry time

	done

