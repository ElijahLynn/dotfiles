# Drush autocompletion
#
# Place this in your ~/.config/fish/completions/ directory, or in the
# /etc/fish/completions directory to make it available for all users.

function __complete_drush
  drush --early=includes/complete.inc (commandline -cpo) (commandline -t)|cut -d " " -f 1
  end

  complete -x -c drush -d "Drush" -a "(__complete_drush)"
