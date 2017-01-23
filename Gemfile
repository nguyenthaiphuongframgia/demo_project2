source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "faker", "~> 1.6", ">= 1.6.6"
gem "rails", "~> 5.0.1"
gem "mysql2", ">= 0.3.18", "< 0.5"
gem "puma", "~> 3.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "coffee-rails", "~> 4.2"
gem "jquery-rails"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "carrierwave"
gem "mini_magick"
gem "config"
gem "roo"
gem "to_xls-rails"
gem "roo-xls"
gem "chartkick"
gem "highcharts-rails"
gem "hightop"
gem "bootstrap-datepicker-rails"
gem 'bootstrap3-datetimepicker-rails', '~> 3.1.2'
gem "devise"
gem "cancancan"
gem "omniauth"
gem "omniauth-twitter"
gem "omniauth-facebook"
gem "omniauth-instagram"
gem "bootstrap-sass", "3.3.6"
gem "rails_12factor"
gem "ransack"
gem "rubyzip", "~> 1.1.0"
gem "axlsx", "2.1.0.pre"
gem "axlsx_rails"
gem "kaminari"
gem "bootstrap-kaminari-views"
gem 'momentjs-rails', '>= 2.8.1'
gem "figaro"
gem "ratyrate"
gem "font-awesome-rails"

group :development, :test do
  gem "byebug", platform: :mri
  gem 'rails_12factor'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
