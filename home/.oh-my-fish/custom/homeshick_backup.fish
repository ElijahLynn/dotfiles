#! /usr/bin/fish
# Runs every 5 minutes via crontab.

cd $HOME/.homesick/repos/dotfiles

# Commit any dotfiles changes.
if not git diff --exit-code; not git diff --cached --exit-code; git ls-files --other --exclude-standard --directory
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
    if test (git rev-parse --verify master) = (git rev-parse --verify origin/master)
        notify-send "Dotfiles updated and pushed to Github"
    else
        notify-send "There was a problem pushing your dotfiles to Github"
    end
end


if $argv
 echo (count $argv)
 echo it is yes
 else
 echo it is not
end
# Export Fish abbreviations and commit them.
if false

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
    if test (git rev-parse --verify master) = (git rev-parse --verify origin/master)
        notify-send "Dotfiles updated and pushed to Github"
    else
        notify-send "There was a problem pushing your dotfiles to Github"
    end
end
