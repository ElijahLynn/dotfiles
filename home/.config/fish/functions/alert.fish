function alert
	if contains -- --sms $argv[1]
	echo 'Job is done with a status of ' $status ' @' (date)| twilio-sms 903-354-5247 > /dev/null 
        end
        paplay ~/.config/fish/functions/TaDa.ogg
end
