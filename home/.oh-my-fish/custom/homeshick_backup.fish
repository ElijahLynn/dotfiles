#! /usr/bin/fish
# Runs every 5 minutes.

command notify-alert cron1

#also backup abbr --show here.

cd $HOME/.homesick/repos/dotfiles
command notify-alert cron

if false
    command git add --update
    command git commit -m "Update Sunday.... list files"
    command notify-alert "dotfiles updated and pushed, link to commit: list of files"
end



