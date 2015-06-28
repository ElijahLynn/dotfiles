#! /usr/bin/fish
# Runs every 5 minutes via crontab.
# Needs patched NotifyOSD.
# @see http://www.webupd8.org/2014/04/configurable-notification-bubbles-for.html

cd $HOME/.homesick/repos/dotfiles

# keychain support, so crontab doesn't ask for a key passphrase every git push.
# @see http://superuser.com/a/933903/30982
source $HOME/.keychain/(hostname)-fish

# Export Fish abbreviations and commit them.
abbr --show | sort > fish_abbreviation_backup;
if not git diff --exit-code fish_abbreviation_backup
    # fish doesn't sort abbr --show yet
    # @see
    source $HOME/.oh-my-fish/custom/fish_abbreviation_backup

    git add fish_abbreviation_backup
    git commit --message "Update Fish abbreviations"
    set push_needed yes
end

# Commit any dotfiles changes.
if not git diff --exit-code; or
   not git diff --cached --exit-code; or

       # Update dotfiles.
       git add --all
       git commit --message "Update dotfiles"
       set push_needed yes
end

# Push & Notify.
if test $push_needed = yes
    git push
    if test (git rev-parse --verify master) = (git rev-parse --verify origin/master)
        notify-send --expire-time=1000 "Dotfiles updated and pushed to Github"
    else
        notify-send --expire-time=1000 "There was a problem pushing your dotfiles to Github"
    end
end
