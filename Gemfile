source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'yaml_db'
gem 'haml-rails'
gem "devise", ">= 2.2.3"
gem "cancan", ">= 1.6.9"
gem "rolify", ">= 3.2.0"
gem "devise_ldap_authenticatable", '0.6.1'
gem 'will_paginate'
gem 'jquery-rails', '~> 1.0.14'
gem 'nested_form'
gem 'simple_form'
gem 'activeadmin'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

# Used only if oracle db is being used
group :oracle do
  gem 'activerecord-oracle_enhanced-adapter'
  gem 'ruby-oci8'
end
group :mssql do
  gem 'tiny_tds'
  gem 'activerecord-sqlserver-adapter'
end


group :development, :test do
  gem "sqlite3"
  gem "rspec"
  gem 'rspec-rails', ">= 2.12.2"
  gem 'rb-readline', '~> 0.4.2'
  gem "spork", "> 0.9.0.rc"
  gem "factory_girl", "2.2.0"
  gem "factory_girl_rails", "1.3.0"
  gem "shoulda-matchers"
  gem 'database_cleaner', '< 1.1.0'
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
  gem 'rake'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'cucumber-rails', :require => false
  gem 'coveralls', :require => false
end

group :development do
  gem 'capistrano'
end
