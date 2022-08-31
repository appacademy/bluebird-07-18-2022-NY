source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.1"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Used for generating a salted and hashed password_digest
gem 'bcrypt'


group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  # gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'byebug'
  gem 'rspec-rails' # the rails version of rspec
  gem 'factory_bot_rails' # factory_bot allows us to automatically create models and place them into our test DB
  gem 'rails-controller-testing' # Gives us some cool methods to help our testing
end

group :test do
  gem 'faker' # Allows us to seed our DB with fake info really easily.  Faker is super useful for seeding mundane information.
  gem 'capybara' # Specifically for integration testing #included in the default Gemfile but point it out to the students 

  gem 'guard-rspec' # let's you auto-run specs when files are modified
  gem 'launchy' # automatically opens the page in the browser when we use save_and_open_page
  gem 'shoulda-matchers' # gives us some great one liner syntax for testing
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'annotate' # for annotating our models
  gem 'pry-rails'
  gem 'better_errors' # Will give us nice formatted errors 
  gem 'binding_of_caller' # Will allow us to poke around our code at the time it broke
end

