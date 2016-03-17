function xdebug
	switch $argv[1]
	case 'on'
            set --export --global XDEBUG_CONFIG 'idekey=phpstorm'
            echo Xdebug activated
	case 'off'
            set --erase XDEBUG_CONFIG
	    echo Xdebug deactivated
    end
end
