require 'test_helper'

class Ketsuban::PostgreSQLAdapterTest < ActiveSupport::TestCase
  def around(&tests)
    use_postgresql
    DatabaseCleaner.cleaning(&tests)
  end

  test "Skip Array" do
    User.unlucky_numbers [1, 3]
    Book.unlucky_numbers []
    assert_equal [2, 4, 5, 6, 7], Array.new(5) { User.create.id }
    assert_equal (1..5).to_a, Array.new(5) { Book.create.id }
  end

  test "Skip by Proc" do
    User.ketsuban ->(next_id) { next_id.odd? }
    assert_equal [2, 4, 6, 8, 10], Array.new(5) { User.create.id }
  end
end

class Ketsuban::MySQLAdapterTest < ActiveSupport::TestCase
  def around(&tests)
    use_mysql
    DatabaseCleaner.cleaning(&tests)
  end

  test "Skip Array" do
    User.unlucky_numbers [1, 3]
    Book.unlucky_numbers []
    assert_equal (1..5).to_a, Array.new(5) { Book.create.id }
    assert_equal [2, 4, 5, 6, 7], Array.new(5) { User.create.id }
  end

  test "Skip by Proc" do
    User.ketsuban ->(next_id) { next_id.odd? }
    assert_equal [2, 4, 6, 8, 10], Array.new(5) { User.create.id }
  end
end

class Ketsuban::SQLiteAdapterTest < ActiveSupport::TestCase
  def around(&tests)
    use_sqlite
    DatabaseCleaner.cleaning(&tests)
  end

  test "Skip Array" do
    User.unlucky_numbers [1, 3]
    Book.unlucky_numbers []
    assert_equal (1..5).to_a, Array.new(5) { Book.create.id }
    assert_equal [2, 4, 5, 6, 7], Array.new(5) { User.create.id }
  end

  test "Skip by Proc" do
    User.ketsuban ->(next_id) { next_id.odd? }
    assert_equal [2, 4, 6, 8, 10], Array.new(5) { User.create.id }
  end
end
