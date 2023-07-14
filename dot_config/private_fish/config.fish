## Homebrew integration
eval (/opt/homebrew/bin/brew shellenv)

## https://iterm2.com/documentation-shell-integration.html
source ~/.iterm2_shell_integration.fish

## asdf support
## https://asdf-vm.com/guide/getting-started.html
source /opt/homebrew/opt/asdf/libexec/asdf.fish

set --global fish_greeting ""

function just_the_time --description 'Shows just the time in 24-hour format'
    date +"%H:%M:%S"
end

function fish_prompt
    echo ""
    echo ----------------------------------------------
    echo -n (just_the_time)
    echo " RC: $status"
    echo ----------------------------------------------
 
    set -g __fish_git_prompt_show_informative_status yes
    set -g __fish_git_prompt_showuntrackedfiles yes
    echo -e (set_color $fish_color_cwd) (prompt_pwd)(set_color brown)(fish_git_prompt)
    # set --erase --global branch
    echo (iterm2_prompt_mark) ""
end
