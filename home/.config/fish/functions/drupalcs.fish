function drupalcs
	phpcs --standard=./vendor/drupal/coder/coder_sniffer/Drupal --ignore="**/*.features.*,**/*.field_group.inc,**/*.strongarm.inc,**/*.views_default.inc,**/*.default_permission_sets.inc,**/*.tpl.php,*.js" docroot/profiles/publisher/modules/custom
end

