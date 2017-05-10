source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.0'
gem 'puma', '~> 3.7'
gem 'mongoid'
gem 'jbuilder'
gem 'devise', github: 'plataformatec/devise'
gem 'omniauth-github'
gem 'sass-rails'
gem 'semantic-ui-sass'
gem 'autoprefixer-rails'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'mongoid-autoinc'
gem 'octokit'
gem 'html-pipeline'
gem 'github-linguist'
gem 'gemoji'
gem 'github-markdown'
gem 'sanitize'
gem 'rinku'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 3.5'
  gem 'rspec-its'
  gem 'rails-controller-testing'
  gem 'mongoid-rspec', github: 'mongoid-rspec/mongoid-rspec'
  gem 'vcr'
  gem 'webmock'
  gem 'mocha'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'foreman'
  gem 'guard-rspec', '~> 4.7.0', require: false
  gem 'guard-rubocop', require: false
  gem 'guard-bundler', require: false
end

group 'test' do
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
