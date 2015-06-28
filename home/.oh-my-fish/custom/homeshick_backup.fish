#! /usr/bin/fish
# Runs every 5 minutes via crontab.

source $HOME/.keychain/(hostname)-fish

cd $HOME/.homesick/repos/dotfiles

# Export Fish abbreviations and commit them.
abbr --show | sort > fish_abbreviation_backup;
if not git diff --exit-code fish_abbreviation_backup
    git add fish_abbreviation_backup
    git commit --message "Update Fish abbreviations"
    set -g commits_made yes
end

# Commit any dotfiles changes.
if not git diff --exit-code; or
   not git diff --cached --exit-code; or
   git ls-files --other --exclude-standard --directory;

       # Update dotfiles.
       git add --all
       git commit --message "Update dotfiles"
       set -g commits_made yes

       echo $commits_made;
end

echo $commits_made;

if $commits_made = 'yes'
    # Push & Notify.
    git push
    if test (git rev-parse --verify master) = (git rev-parse --verify origin/master)
        notify-send --expire-time=1000 "Dotfiles updated and pushed to Github"
    else
        notify-send --expire-time=1000 "There was a problem pushing your dotfiles to Github"
    end
end
