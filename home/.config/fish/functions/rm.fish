function rm
	if test status --is-interactive
	    echo "This is not the command you are looking for, use trash-put instead."; false
        end
end
