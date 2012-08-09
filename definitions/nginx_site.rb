define :nginx_site, :enable => true do
  base_file    = "/etc/nginx/sites-available/#{params[:name]}"
  enabled_file = "/etc/nginx/sites-enabled/#{params[:name]}"
  if params[:enable]
    execute "enable nginx site #{params[:name]}" do
      command "ln -s '#{base_file}' '#{enabled_file}'"
      notifies :reload, "service[nginx]", :delayed
      not_if { ::File.symlink?(enabled_file) }
    end
  else
    execute "disable nginx site #{params[:name]}" do
      command "rm -rf '#{enabled_file}'"
      notifies :reload, "service[nginx]", :delayed
      only_if { ::File.symlink?(enabled_file) }
    end
  end
end