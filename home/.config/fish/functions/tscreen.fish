function tscreen
	set --local NAME 'Wacom ISDv4 E2 Finger touch'
    set --local ENABLED (xsetwacom --get $NAME touch)
    switch $ENABLED
        case 'on'
            xsetwacom --set $NAME touch off
            notify-send --urgency=critical --expire-time=1500 'Touchscreen disabled'

        case 'off'
            xsetwacom --set $NAME touch on
            notify-send --urgency=critical --expire-time=1500 'Touchscreen enabled'
    end
end
