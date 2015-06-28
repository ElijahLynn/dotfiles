function file_path
	set file_path (readlink -f $argv)
	echo $file_path | clipboard
	echo $file_path  "copied to clipboard"
end
