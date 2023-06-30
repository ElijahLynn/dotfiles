## Homebrew integration
eval (/opt/homebrew/bin/brew shellenv)

## https://iterm2.com/documentation-shell-integration.html
source ~/.iterm2_shell_integration.fish

## asdf support
## https://asdf-vm.com/guide/getting-started.html
source /opt/homebrew/opt/asdf/libexec/asdf.fish

abbr -a -- gs 'git status'
abbr -a -- code code-insiders
abbr -a -- g 'git'
abbr -a -- ga 'git add'
abbr -a -- gaa 'git add --all'
abbr -a -- gc 'git commit'
abbr -a -- gca 'git commit --amend'
abbr -a -- gd  'git diff'
abbr -a -- gds 'git diff --staged'
abbr -a -- gfa 'git fetch --all'
abbr -a -- gl 'git log'
abbr -a -- ll 'ls -al'
abbr -a -- tf 'terraform'
 

set --global fish_greeting ""

function just_the_time --description 'Shows just the time in 24-hour format'
    date +"%H:%M:%S"
end

function fish_prompt
    echo ""
    echo "----------------------------------------------"
    set -g __fish_git_prompt_show_informative_status yes
    echo -n (just_the_time)
    echo -e (set_color $fish_color_cwd) (prompt_pwd)(set_color brown)(fish_git_prompt)
    # set --erase --global branch
    echo (iterm2_prompt_mark) ""
end
