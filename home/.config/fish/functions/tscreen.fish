function tscreen
	set ID (xinput list | grep Wacom | awk -F= '{ print $2 }' | cut -c1-2)
switch $argv[1]
case 'on'
xinput enable $ID
echo 'Touchscreen enabled'
case 'off'
xinput disable $ID
echo 'Touchscreen disabled'
end
end
