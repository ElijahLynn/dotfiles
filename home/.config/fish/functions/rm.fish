function rm
	if status --is-login; and status --is-interactive
	    echo "This is not the command you are looking for, use trash-put instead.";
        end
end
