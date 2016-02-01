function xdebug
	switch $argv[1]
	case 'on'
            set -xU XDEBUG_CONFIG 'idekey=phpstorm'
            echo Xdebug activated
	case 'off'
            set -e XDEBUG_CONFIG
	    echo Xdebug deactivated
    end
end
