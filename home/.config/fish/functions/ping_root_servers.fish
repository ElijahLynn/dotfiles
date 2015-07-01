function ping_root_servers
	set -l sf_root_servers\
	192.58.128.30\
	199.7.91.13
	for x in $sf_root_servers
		ping -W1 -c1 $x | sed --quiet '2p'
		
		end
end
