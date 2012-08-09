maintainer       "Filter Squad"
maintainer_email "darcy@filtersquad.com"
license          "Apache 2.0"
description      "Handles managing Rubies and the like from brightbox"
long_description "Handles managing Rubies and the like from brightbox as well as adding support for nginx"
version          "0.0.1"

supports 'ubuntu'

recipe "brightbox::ruby",            "Installs and sets Ruby 1.9.3 as the default Ruby."
recipe "brightbox::nginx_passenger", "Installs and configures nginx using passenger."

depends "apt"
