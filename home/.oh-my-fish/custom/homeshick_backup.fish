#! /usr/bin/fish
# Runs every 5 minutes via crontab.

source $HOME/.keychain/(hostname)-fish

cd $HOME/.homesick/repos/dotfiles

# Export Fish abbreviations and commit them.
abbr --show | sort > fish_abbreviation_backup;
if not git diff --exit-code fish_abbreviation_backup
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
