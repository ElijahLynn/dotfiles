#! /usr/bin/fish
# Runs every minute via crontab.

HOME=/home/elijah

# Export Fish abbreviations and commit them.
cd $HOME/.homesick/repos/dotfiles
abbr --show | sort > fish_abbreviation_backup
if not git diff --exit-code fish_abbreviation_backup
    git add fish_abbreviation_backup
    git commit --message "Update Fish abbreviations"
end

# Commit any dotfiles changes.
if not git diff --exit-code
    git add --all
    git commit --message "Update dotfiles"
end

# Push & Notify
if git push
    notify-send "Dotfiles updated and pushed to Github"
end
