#! /usr/bin/fish
# Runs every 5 minutes via crontab.
# Needs patched NotifyOSD for notify-send --expire-time to work.
# @see http://www.webupd8.org/2014/04/configurable-notification-bubbles-for.html
# @todo Make commit messages a bit more detailed about what files changed.

cd $HOME/.homesick/repos/dotfiles

# keychain support, so crontab doesn't ask for a key passphrase every git push.
# @see http://superuser.com/a/933903/30982
source $HOME/.keychain/(hostname)-fish

# Export Fish abbreviations and commit them.
abbr --show | sort > fish_abbreviation_backup;
if not git diff --exit-code fish_abbreviation_backup
    # fish doesn't sort abbr --show yet so lets source it in as such.
    # @see https://github.com/fish-shell/fish-shell/issues/2156
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
        notify-send --expire-time=3000 "Dotfiles updated and pushed to Github"
    else
        notify-send --expire-time=3000 "There was a problem pushing your dotfiles to Github"
    end
end
