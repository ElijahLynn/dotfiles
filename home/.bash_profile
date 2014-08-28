# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Bash will not load ~/.profile if ~/.bash_profile exists.
if [ -f ~/.profile ]; then
    source ~/.profile;
fi

