function rm
	if status --is-login
	    echo "This is not the command you are looking for, use trash-put instead."; false
        end
end
