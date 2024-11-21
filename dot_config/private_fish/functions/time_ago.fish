function time_ago
    set timestamp $argv[1]
    if test -z "$timestamp"
        echo "Usage: time_ago <unix_timestamp>"
        return 1
    end
    set current (date +%s)
    set diff (math "$current - $timestamp")
    if test "$diff" -lt 60
        echo "$diff seconds ago"
    else if test "$diff" -lt 3600
        set minutes (math "$diff / 60")
        echo "$minutes minutes ago"
    else if test "$diff" -lt 86400
        set hours (math "$diff / 3600")
        echo "$hours hours ago"
    else
        set days (math "$diff / 86400")
        echo "$days days ago"
    end
end
