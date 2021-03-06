source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Stack
gem 'rails', '~> 5.0.2'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'foreman'

# View
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'bootstrap-sass'
gem 'coffee-script'


# Auth
gem 'devise'

# Misc
gem 'google-player', github: 'jayshreeanand/google-player'

# NLU
gem 'sentimental'
gem 'wit'
gem 'easy_translate' # google translate

# External APIs
gem 'twitter'
gem 'ruby-trello'

# Charts
gem 'chartkick'
gem 'groupdate'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end


group :production, :staging do
  gem 'rails_12factor'
end