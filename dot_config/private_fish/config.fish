## Homebrew integration
eval (/opt/homebrew/bin/brew shellenv)

## asdf support
## https://asdf-vm.com/guide/getting-started.html
source /opt/homebrew/opt/asdf/libexec/asdf.fish

## SDKMan Support
## https://github.com/sdkman/sdkman-cli/issues/671#issuecomment-1765078814
fish_add_path (find ~/.sdkman/candidates/*/current/bin -maxdepth 0)

## grep
## https://stackoverflow.com/a/77054092/292408
set --global --export PATH $HOMEBREW_PREFIX/opt/grep/libexec/gnubin $PATH

set --global fish_greeting ""

# Created by `pipx` on 2023-11-09 23:11:55
set PATH $PATH /Users/user/.local/bin
source ~/.config/fish/completions/kubectl.fish

# Add
# https://direnv.net/docs/hook.html
direnv hook fish | source

