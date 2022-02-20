source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'sass-rails', '>= 6'
gem 'carrierwave'
gem 'rmagick'
gem 'fog-aws'
gem 'mailjet'
gem 'dotenv-rails'
gem 'pundit'
gem 'resque'
gem "omniauth", "~> 1.9.1"
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'sqlite3', '~> 1.4'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'letter_opener'
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem "capistrano-resque", "~> 0.2.2", require: false
  gem 'listen', '~> 3.3'

  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

#custom
gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n', '~> 6.0.0'
gem 'simple_form'
gem 'webpacker', '~> 5.0'
