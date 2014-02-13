include_recipe "apt"

apt_repository "brightbox-ruby-ng-#{node['lsb']['codename']}" do
  uri          "http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu"
  distribution node['lsb']['codename']
  components   ["main"]
  keyserver    "keyserver.ubuntu.com"
  key          "C3173AA6"
  action       :add
  notifies     :run, "execute[apt-get update]", :immediately
end

packages = ["build-essential", "ruby#{node['brightbox']['ruby']['version']}", "ruby-switch"]
packages << "ruby#{node['brightbox']['ruby']['version']}-dev" if node['brightbox']['ruby']['install_dev_package']
packages.each do |name|
  apt_package name do
    action node['brightbox']['ruby']['default_action']
  end
end

execute "ruby-switch --set ruby#{node['brightbox']['ruby']['version']}" do
  action :run
  not_if "ruby-switch --check | grep -q 'ruby#{node['brightbox']['ruby']['version']}'"
end

cookbook_file "/etc/gemrc" do
  action :create_if_missing
  source "gemrc"
  mode   "0644"
end

node['brightbox']['ruby']['gems'].each do |gem|
  gem_package gem do
    action node['brightbox']['ruby']['default_action']
  end
end

# Regenerate the binstups for rubygems-bundler.
execute "gem regenerate_binstubs" do
  action :nothing
  subscribes :run, resources('gem_package[rubygems-bundler]')
end
