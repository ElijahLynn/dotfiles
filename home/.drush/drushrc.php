<?php

# Added per README.txt to help send usage data.
$options['drush_usage_log'] = TRUE;
$options['drush_usage_send'] = TRUE;

# Default password for drush installs.
$options['account-pass'] = 'pa55word';

$options['shell-aliases']['site-get'] = '@none php-eval "return drush_sitealias_site_get();"';
$options['shell-aliases']['pm-clone'] = 'pm-download --gitusername=ElijahLynn --package-handler=git_drupalorg';
