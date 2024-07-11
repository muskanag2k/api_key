#  code coverage analysis tool
#   https://github.com/simplecov-ruby/simplecov
require 'simplecov'
SimpleCov.start 'rails'
# raketask grouped in simplecov code coverage
SimpleCov.start do
  add_group "RakeTask", ["app/lib/tasks/check_rpr_escalation.rake", "app/lib/tasks/daily_cycle_update.rake", "app/lib/tasks/general_insights.rake", "app/lib/tasks/had_sex.rake", "app/lib/tasks/have_sex.rake", "app/lib/tasks/reasoning_engine.rake"]
  add_filter "app/controllers/admin"
  add_filter "app/policies"
end

require 'rake'
# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
# require './spec/helpers/factory_helper'

require File.expand_path('../config/environment', __dir__)
require 'support/factory_bot'

# require './spec/helpers/controller_helper'
# require './spec/helpers/model_helper'
# require './spec/helpers/rake_task_helper'
require "paperclip/matchers"
# require "pundit/matchers"

# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'airborne'
require "email_spec"
require "email_spec/rspec"
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.before(:each, type: :controller) do
    @routes = Rails.application.routes
  end
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  # config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  # Adds Devise helpers
  # https://github.com/heartcombo/devise#test-helpers
  # config.include Devise::Test::ControllerHelpers, type: :controller
  # config.include Devise::Test::ControllerHelpers, type: :view
  # config.include Devise::Test::IntegrationHelpers, type: :feature

  # config.include ControllerHelper
  # config.include ModelHelper
  # config.include RakeTaskHelper
  # config.include FactoryHelper
  # config.render_views = true
  config.include Paperclip::Shoulda::Matchers
  config.include FactoryBot::Syntax::Methods
end

#Shoulda Matchers provides RSpec- and Minitest-compatible one-liners to test common Rails functionality
# https://github.com/thoughtbot/shoulda-matchers
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
  with.test_framework :rspec
  with.library :rails
  end
end

# FactoryBot::SyntaxRunner.class_eval do
#   include RSpec::Mocks::ExampleMethods
#   include FactoryHelper
# end


FactoryBot::SyntaxRunner.class_eval do
  include RSpec::Mocks::ExampleMethods
  include FactoryBot::Syntax::Methods
end
