default: bundle update_cookbooks foodcritic integration

bundle:
	bundle update

update_cookbooks:
	berks install
	berks update

foodcritic:
	thor foodcritic:lint --epic-fail any

integration:
	kitchen test -p --destroy=always

docs:
	bundle exec knife cookbook doc .
