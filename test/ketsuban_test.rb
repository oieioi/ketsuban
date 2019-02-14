require 'test_helper'

class Ketsuban::AdapterTest < ActiveSupport::TestCase
  def around(&tests)
    DatabaseCleaner.cleaning(&tests)
  end
  test "PostgreSQL" do
    use_postgresql
    User.unlucky_numbers [1, 3]
    Book.unlucky_numbers []
    assert_equal (1..5).to_a, Array.new(5) { Book.create.id }
    assert_equal [2, 4, 5, 6, 7], Array.new(5) { User.create.id }
  end

  test "Mysql2" do
    use_mysql
    User.unlucky_numbers [1, 3]
    Book.unlucky_numbers []
    assert_equal (1..5).to_a, Array.new(5) { Book.create.id }
    assert_equal [2, 4, 5, 6, 7], Array.new(5) { User.create.id }
  end
end

class Ketsuban::ConfigUnluckyNumbersTest < ActiveSupport::TestCase
  def around(&tests)
    use_postgresql
    DatabaseCleaner.cleaning(&tests)
  end

  test "Array" do
    User.ketsuban [1, 2, 3, 4, 5]
    assert_equal [6, 7, 8, 9, 10], Array.new(5) { User.create.id }
  end

  test "Proc" do
    User.ketsuban ->(next_id) { next_id.odd? }
    assert_equal [2, 4, 6, 8, 10], Array.new(5) { User.create.id }
  end
end
