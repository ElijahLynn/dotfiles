#! /usr/bin/fish
# Runs every 5 minutes via crontab.
# Needs patched NotifyOSD for notify-send --expire-time to work.
# @see http://www.webupd8.org/2014/04/configurable-notification-bubbles-for.html
# @todo Make commit messages a bit more detailed about what files changed.
#
#

# Crontab setup
# Needed to use notify-send                                                         
# @see http://unix.stackexchange.com/a/111189/27902                                 
# DISPLAY=:0.0                                                                        
#                                                                                   
# * * * * * /home/elijah/.oh-my-fish/custom/homeshick_backup.fish > /dev/null 2>&1    
set push_needed 0 
cd $HOME/.homesick/repos/dotfiles

# keychain support, so crontab doesn't ask for a key passphrase every git push.
# @see http://superuser.com/a/933903/30982
source $HOME/.keychain/(hostname)-fish
notify-send '39'

# Export Fish abbreviations and commit them.
abbr --show | sort > fish_abbreviation_backup;
# @todo Figure out why this has to be inverted. Doesn't make sense.
if git diff --exit-code fish_abbreviation_backup
    # fish doesn't sort abbr --show yet so lets source it in as such.
    # @see https://github.com/fish-shell/fish-shell/issues/2156
    source fish_abbreviation_backup

    git add fish_abbreviation_backup
    git commit --message "Update Fish abbreviations"
    set push_needed 
end

# Homeshick track any new functions
if not diff --recursive $HOME/.config/fish/functions $HOME/.homesick/repos/dotfiles/home/.config/fish/functions
    cd $HOME/.config/fish/functions
    homeshick track dotfiles *
    cd -
    git add --all
    git commit --message "Update functions"
    set push_needed 
end

# Commit any dotfiles changes.
if not git diff --exit-code; or
   not git diff --cached --exit-code; or

       # Update dotfiles.
       git add --all
       git commit --message "Update dotfiles"
       set push_needed  
end

# Push & Notify.
if [ $push_needed -eq 1 ]
    git push
    if test (git rev-parse --verify master) = (git rev-parse --verify origin/master)
        notify-send --expire-time=3000 "Dotfiles updated and pushed to Github"
    else
        notify-send --expire-time=3000 "There was a problem pushing your dotfiles to Github"
    end
end
