source 'https://rubygems.org'

ruby '2.5.0'

git_source(:github) do |repo_name|
 repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
 "https://github.com/#{hstetts}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'

gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootstrap-sass'
gem 'devise'
gem 'figaro', '1.0'
gem 'pundit'
gem 'faker'
gem 'stripe'
gem 'redcarpet'

group :production do
 gem 'pg'
end

group :development do
 gem 'sqlite3'
 gem 'web-console'
 gem 'listen', '~> 3.0.5'
end

group :development, :test do
 gem 'rspec-rails', '~> 3.0'
 gem 'rails-controller-testing'
 gem 'shoulda'
end
