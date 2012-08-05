source 'http://rubygems.org'

gem 'rails', '3.2.7'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'bootstrap-sass'
  gem 'sass-rails', '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'simple_form'

group :development do
  gem 'brakeman'
  gem 'bullet'
  gem 'execjslint', :require => false
  gem 'rails_best_practices'
  gem 'thin'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'sqlite3'
end

group :production do
  gem 'mysql2'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
end
