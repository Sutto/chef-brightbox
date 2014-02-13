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
