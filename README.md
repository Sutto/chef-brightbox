# chef-brightbox

This recipe provides support for installing the BrightBox builds
of Ruby 1.9.3, Nginx and Passenger.

For more documentation on these builds, please see [the official brightbox documentation](http://blog.brightbox.co.uk/posts/next-generation-ruby-packages-for-ubuntu).

## Usage

Simple add `chef-brightbox` to your recipe, and then include one of the following
recipes:

<table>
  <tr>
    <th>Name</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>brightbox::default</td>
    <td>Installs the ruby and nginx passenger recipes.</td>
  </tr>
  <tr>
    <td>brightbox::ruby</td>
    <td>Adds the repository, Installs The full Ruby 1.9 package from brightbox, sets it as the default then installs a sane server gemrc and adds bundler, rake and rubygems-bundler gems to bootstrap your environment.</td>
  </tr>
  <tr>
    <td>brightbox::nginx_passenger</td>
    <td>Requires the ruby recipe, will install passenger with 1.9.1 and nginx, setting up nginx to use passenger.</td>
  </tr>
</table>

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

## Contributing

We encourage all community contributions. Keeping this in mind, please follow these general guidelines when contributing:

* Fork the project
* Create a topic branch for what you’re working on (git checkout -b awesome_feature)
* Commit away, push that up (git push your\_remote awesome\_feature)
* Create a new GitHub Issue with the commit, asking for review. Alternatively, send a pull request with details of what you added.
* Once it’s accepted, if you want access to the core repository feel free to ask! Otherwise, you can continue to hack away in your own fork.

Other than that, our guidelines very closely match the GemCutter guidelines [here](http://wiki.github.com/qrush/gemcutter/contribution-guidelines).

(Thanks to [GemCutter](http://wiki.github.com/qrush/gemcutter/) for the contribution guide)

## Copyright

Copyright 2012 Filter Squad.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
