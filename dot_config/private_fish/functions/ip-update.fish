# https://gist.github.com/ElijahLynn/b2c1318856492b291a1b66151223d0e8

function just_the_time --description 'Shows just the time in 24-hour format'
    date +"%H:%M:%S"
end

function get_last_ip --description 'Get the last IP address from string'
    # example1: Updated el-sl.port0.org from 206.81.117.141 to 206.81.117.129
    # example2: No IP change detected for el-sl.port0.org with IP 206.81.117.129, skipping update
    echo $argv | grep --only-matching --extended-regexp "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" | awk 'END{print}'
end

function ip-update
    set sleep_time 5
    set success_count 0
    set success_count_max 10

    # SUPER TODO: Convert this all to an Ansible script
    #

    # ---
    # - name: Wait for IP occurrence
    #   hosts: localhost
    #   vars:
    #     counter: 0
    #     target_ip: "192.168.1.1"
    #   tasks:
    #     - name: Loop until IP occurs 5 times
    #       command: your_command_here
    #       register: result
    #       until: counter >= 5
    #       retries: 50  # Number of retries before giving up
    #       delay: 10  # Delay in seconds between retries
    #       ignore_errors: yes
    #       vars:
    #         counter: "{{ counter + (result.stdout is search(target_ip)) | int }}"

    #     - name: Next task
    #       debug:
    #         msg: "Proceeding to next step"


    # TODO: At end check curl https://ci.dev.hedera-devops.com/ --silent as that is what really matters

    # TODO: Possibly just skip all of this if:
    #        No IP change detected for el-sl.port0.org with IP 206.81.117.129, skipping update

    # TODO: Sometimes afraid gets the local IP wrong, dunno why. Compare it with output of
    # curl --silent ipinfo.io/ip. If no match, retry with afraid until it gets it right.

    # TODO: Change this to target_ip or new_ip or afraid_target_ip or afraid_ip
    set afraid_dns_update (curl --silent http://sync.afraid.org/u/SDK9tmQWwc9Mt4kXzo36SqGP/)
    echo $afraid_dns_update
    set --global afraid_dns_ip (get_last_ip $afraid_dns_update)

    # Monitor for DNS changes and mark when the global DNS matches the afraid_dns_ip
    while true
        set global_dns_ip (dig +short el-sl.port0.org)
        just_the_time
        echo "Checking DNS..."
        echo "Global DNS IP: $global_dns_ip, Afraid DNS IP: $afraid_dns_ip"
        if test $global_dns_ip = $afraid_dns_ip
            set success_count (math $success_count + 1)
            echo "DNS matches, success count: $success_count"
            if test $success_count -eq $success_count_max
                echo "$success_count_max successful matches, updating allowlist..."
                break
            end
        else
            set success_count 0
            echo "No match, sleeping $sleep_time seconds..."
            echo "Success count: $success_count"
        end

        echo "DNS check needs $success_count_max continuous match(es), sleeping for $sleep_time seconds..."
        echo ""
        sleep $sleep_time
    end

    # Run the kubectl allowlist
    set contexts dev prod
    for context in $contexts
        kubectl --context gke_devops-1-254919_us-central1_devops-$context-1122 \
            --namespace allowlist \
            --from cronjob/allowlist \
            create job update-allowlist-(date +%Y%m%d.%H%M)
    end

    if test $status -eq 0
        sleep $sleep_time
        echo "SUCCESS: Kubectl allowlist job created, try Jenkins now..."
    else
        echo "ERROR: Failed to create Kubectl allowlist update job, exiting..."
    end
end
