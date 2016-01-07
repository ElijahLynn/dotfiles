function mc_watch
	memcache stat watcher
	watch "echo stats | nc 127.0.0.1 11211"
end
