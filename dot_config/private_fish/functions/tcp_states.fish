function tcp_states
watch -n 1 "netstat -an | awk '/^tcp/ { ++S[\$NF] } END { for(a in S) print a, S[a] }'"

end
