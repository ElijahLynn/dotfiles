#! /usr/bin/fish
# Runs every minute via crontab.

cd $HOME/.homesick/repos/dotfiles

# Commit any dotfiles changes.
if not git diff --exit-code; git diff --cached --exit-code; git ls-files --other --exclude-standard --directory
    # Export Fish abbreviations and commit them.
    abbr --show | sort > fish_abbreviation_backup
    if not git diff --exit-code fish_abbreviation_backup
        git add fish_abbreviation_backup
        git commit --message "Update Fish abbreviations"
    end

    # Update dotfiles.
    git add --all
    git commit --message "Update dotfiles"

    # Push & Notify.
    git push
    notify-send "Dotfiles updated and pushed to Github"
end

