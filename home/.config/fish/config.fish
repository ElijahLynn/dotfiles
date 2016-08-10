# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme agnoster

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Load Homeshick
. $HOME/.homesick/repos/homeshick/homeshick.fish

# keychain support
# @see http://superuser.com/a/933903/30982
#if not status --is-interactive
#  keychain --eval --quiet --quick $HOME/.ssh/id_rsa | source
#end

# http://superuser.com/questions/84615/how-do-you-source-a-file-in-fish/933903#933903
# http://serverfault.com/questions/92683/execute-rsync-command-over-ssh-with-an-ssh-agent-via-crontab

# Custom function to load so tmux will change the title of panes.
#tmux_pane_title

set -g -x PATH /home/elijah/Android/Sdk/platform-tools/ $PATH

fish_vi_key_bindings

