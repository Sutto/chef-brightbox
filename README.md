# Description

This recipe provides support for installing the BrightBox builds of Ruby 2.1, Nginx and Passenger.

For more documentation on these builds, please see [the official brightbox documentation](http://blog.brightbox.co.uk/posts/next-generation-ruby-packages-for-ubuntu).

**Please Note:** If you're upgrading from an older version, the default action is to upgrade packages. To change this, you need
to override `node['brightbox']['ruby']['default_action']`.

# Requirements

## Platform:

* Ubuntu

## Cookbooks:

* apt

# Attributes

* `node['brightbox']['ruby']['default_action']` - Default action for Ruby install. Available options: `:upgrade`, `:install`. Defaults to `:upgrade`.
* `node['brightbox']['ruby']['version']` - The version of Ruby to install. Defaults to `2.1`.
* `node['brightbox']['ruby']['install_dev_package']` - Install the dev package, which provides headers for gem native extensions. Available options: `true`, `false`. Defaults to `true`.
* `node['brightbox']['ruby']['gems']` - Gems to be installed by default. Defaults to `["bundler", "rake", "rubygems-bundler"]`.

# Recipes

* brightbox::default - Installs the ruby and nginx passenger recipes.
* brightbox::ruby - Adds the repository, installs the Ruby 2.1 package from brightbox, sets it as the default then installs a sane server gemrc and adds bundler, rake and rubygems-bundler gems to bootstrap your environment.
* brightbox::nginx_passenger - Requires the ruby recipe, will install passenger with 2.1 and nginx, setting up nginx to use passenger.

## Contributing

We encourage all community contributions. Keeping this in mind, please follow these general guidelines when contributing:

* Fork the project
* Create a topic branch for what you’re working on (git checkout -b awesome_feature)
* Commit away, push that up (git push your\_remote awesome\_feature)
* Create a new GitHub Issue with the commit, asking for review. Alternatively, send a pull request with details of what you added.
* Once it’s accepted, if you want access to the core repository feel free to ask! Otherwise, you can continue to hack away in your own fork.

Other than that, our guidelines very closely match the GemCutter guidelines [here](http://wiki.github.com/qrush/gemcutter/contribution-guidelines).

(Thanks to [GemCutter](http://wiki.github.com/qrush/gemcutter/) for the contribution guide)


## Definitions

We provide a `nginx_site` recipe that will enable / disable an nginx vhost.

Usage is similar to:

```ruby
# Use the configuration at /etc/nginx/sites-available/your-application.com
# Note we don't generate that configuration
nginx_site "your-application.com" do
  enable true # Or false, true is default.
end
```


# License and Maintainer

Maintainer:: Filter Squad (<darcy@filtersquad.com>)

License:: Apache 2.0
