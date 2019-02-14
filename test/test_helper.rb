# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require_relative "../test/dummy/config/environment"
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../test/dummy/db/migrate", __dir__)]
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

require "rails/test_unit/reporter"
Rails::TestUnitReporter.executable = 'bin/test'

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("fixtures", __dir__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.file_fixture_path = ActiveSupport::TestCase.fixture_path + "/files"
  ActiveSupport::TestCase.fixtures :all
end

require 'database_cleaner'
require 'minitest/around'

def use_mysql
  config = YAML.load_file(Rails.root.join("config", "database_mysql.yml"))[Rails.env]
  ActiveRecord::Base.establish_connection(config)
end

def use_postgresql
  config = YAML.load_file(Rails.root.join("config", "database.yml"))[Rails.env]
  ActiveRecord::Base.establish_connection(config)
end

use_postgresql
DatabaseCleaner.strategy = :transaction
DatabaseCleaner.clean_with :truncation

use_mysql
DatabaseCleaner.strategy = :transaction
DatabaseCleaner.clean_with :truncation

class Minitest::Spec
  around do |tests|
    use_postgresql
    DatabaseCleaner.cleaning(&tests)
    use_mysql
    DatabaseCleaner.cleaning(&tests)
  end
end
