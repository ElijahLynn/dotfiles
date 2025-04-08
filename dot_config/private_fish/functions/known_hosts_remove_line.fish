function known_hosts_remove_line
    # get total number of lines in the known_hosts file
    set total_lines (wc -l < ~/.ssh/known_hosts | tr -d ' ')
    if test $argv[1] -gt $total_lines
        echo "Line number $argv[1] exceeds total lines ($total_lines) in ~/.ssh/known_hosts"
        return 1
    end
    sed -i '' "$argv[1]d" ~/.ssh/known_hosts
    # check if the sed command was successful
    if test $status -ne 0
        echo "Failed to remove line $argv[1] from ~/.ssh/known_hosts"
        return 1
    end
    echo "Removed line $argv[1] from ~/.ssh/known_hosts"
end
