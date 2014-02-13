name              'brightbox-ruby'
maintainer        'Filter Squad'
maintainer_email  'darcy@filtersquad.com'
license           'Apache 2.0'
description       'Handles managing Rubies from brightbox'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           '0.0.2'

recipe "brightbox-ruby::default", "Adds the brightbox repository, installs the Ruby package, sets it as the default then installs a sane server gemrc and adds bundler, rake and rubygems-bundler gems to bootstrap your environment."

grouping 'brightbox-ruby',
 title: "Ruby install options",
 description: "Set options relevant to installing Ruby"

attribute 'brightbox-ruby/default_action',
 display_name: "Default action for Ruby install",
 description: "Default action for Ruby install",
 choice: [':upgrade', ':install'],
 type: "symbol",
 required: "optional",
 recipes: ['brightbox-ruby'],
 default: ':upgrade'

attribute 'brightbox-ruby/version',
 display_name: "The version of Ruby to install",
 description: "The version of Ruby to install",
 type: "string",
 required: "optional",
 recipes: ['brightbox-ruby'],
 default: '2.1'

attribute 'brightbox-ruby/install_dev_package',
 display_name: "Install the dev package, which provides headers for gem native extensions",
 description: "Install the dev package, which provides headers for gem native extensions",
 choice: ['true', 'false'],
 required: "optional",
 recipes: ['brightbox-ruby'],
 default: 'true'

attribute 'brightbox-ruby/gems',
 display_name: "Gems to be installed by default",
 description: "Gems to be installed by default",
 type: "array",
 required: "optional",
 recipes: ['brightbox-ruby'],
 default: ["bundler", "rake", "rubygems-bundler"]

supports 'ubuntu'

depends 'apt'
