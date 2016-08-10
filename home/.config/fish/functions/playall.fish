function playall --description 'Plays all audio files in a directory, accepts the file extension as first argument. Good for testing soundbytes, system sounds.'
	for i in *.$argv[1]
		set start (date +%s);
		while test ( math $start + 1 ) -ge (date +%s)
			echo $i
			paplay $i 
		end
	end
end
