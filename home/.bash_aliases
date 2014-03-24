# WEBSITES
alias ww="cd ~/websites/loc.windwalkerexpeditions.com"
alias ki="cd ~/websites/loc.kreesindtrial.com"
alias ao="cd ~/websites/loc.audreyoxenhorn.com"
alias aodbsync="drush pan-sql-sync @ao.loc @ao.dev"
alias web="cd ~/websites"
alias sand='cd ~/websites/sandbox'
alias d7="cd ~/websites/sandbox/d7"
alias d8="cd ~/websites/sandbox/d8"

# GIT
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gg='git tree'
alias gfa='git fetch --all'

# NBCU
alias db="drush dbtv"
alias dp="drush pub7"
alias dp1="drush @pub7.qa1.dev"
alias dp1s="drush @pub7.qa1.stage"
alias dp1p="drush @pub7.qa1.prod"
alias dp2="drush @pub7.qa2.dev"
alias dp2s="drush @pub7.qa2.stage"
alias dp2p="drush @pub7.qa2.prod"
alias dp3="drush @pub7.qa3.dev"
alias dp3s="drush @pub7.qa3.stage"
alias dp3p="drush @pub7.qa3.prod"
alias dp4="drush @pub7.qa4.dev"
alias dp4s="drush @pub7.qa4.stage"
alias dp4p="drush @pub7.qa4.prod"
alias dp5="drush @pub7.qa5.dev"
alias dp5s="drush @pub7.qa5.stage"
alias dp5p="drush @pub7.qa5.prod"
alias dpc="drush @pub7.local cc all;a"

alias p7='cd ~/websites/loc.publisher.nbcuni.com/docroot'
alias p7cu='cd ~/websites/loc.publisher.nbcuni.com/docroot/profiles/all/modules/custom'
alias p7co='cd ~/websites/loc.publisher.nbcuni.com/docroot/profiles/all/modules/contrib'
alias p7m='cd ~/websites/loc.publisher.nbcuni.com/docroot/profiles/all/modules'
alias pbl='bundle exec rake build_local'

# Media Village
alias mdv='cd ~/websites/loc.nbcumedvil.com/docroot'
alias mdvs='cd ~/websites/loc.nbcumedvil.com/docroot/sites/nbcumedvil'

# Shortcut for drush dl --destination=profiles/all/modules/contrib
p7mod='--destination=profiles/all/modules/contrib'
alias p7dump='drush @pub7.local sql-dump --result-file=/tmp/p7.sql'
alias p7restore='drush @pub7.local sql-drop -y && `drush @pub7.local sql-connect` < /tmp/p7.sql'

# LIST VARIATIONS
alias ll='ls -alFh'
alias lsal="ll"
alias la='ls -A'
alias l='ls -CF'

# CD TRICK to naviagate up levels with cd @see http://linux.101hacks.com/cd-command/cd-alias/
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."

# MISC.
alias sbrc='source ~/.bashrc && echo success'
alias vbrc='vim ~/.bashrc'
alias vba='vim ~/.bash_aliases'
alias tp='trash-put'
alias drush6="$HOME/bin/drush/drush"
alias dr="drush"
alias pg='ping google.com'
alias dx='export XDEBUG_CONFIG="idekey=PHPSTORM" && echo "Xdebug activated"'
alias dxd='unset XDEBUG_CONFIG && echo "Xdebug de-activated"'
alias drupalcs='phpcs --standard=Drupal --extensions=module,inc,install,test,profile,theme'
# Why is this here again?
alias sudo='sudo '
alias open='xdg-open' # overwrite default open program

# Make a sound for when commands finish.
export tada='/home/elijah/bin/sounds/TaDa.ogg'
alias a='paplay $tada'

# Logitech Bluetooth Keyboard
alias lbk='sudo hidd --connect 00:1F:20:49:1E:B9'

# tldr alias https://github.com/rprieto/tldr
alias tan='tldr'

