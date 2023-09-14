## Homebrew integration
eval (/opt/homebrew/bin/brew shellenv)

## https://iterm2.com/documentation-shell-integration.html
source ~/.iterm2_shell_integration.fish

## asdf support
## https://asdf-vm.com/guide/getting-started.html
source /opt/homebrew/opt/asdf/libexec/asdf.fish

## grep
## https://stackoverflow.com/a/77054092/292408
set --global --export PATH $HOMEBREW_PREFIX/opt/grep/libexec/gnubin $PATH

set --global fish_greeting ""

function just_the_time --description 'Shows just the time in 24-hour format'
    date +"%H:%M:%S"
end

function fish_prompt
    set --local return_code $status
    echo "  "
    echo ----------------------------------------------
    echo -n (just_the_time)
    echo " RC: $return_code"
    echo ----------------------------------------------
 
    set --global __fish_git_prompt_show_informative_status yes
    set --global __fish_git_prompt_showuntrackedfiles yes
    echo -e (set_color $fish_color_cwd) (prompt_pwd)(set_color brown)(fish_git_prompt)
    echo (iterm2_prompt_mark) ""
end
