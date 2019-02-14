require 'test_helper'

class Ketsuban::Test < ActiveSupport::TestCase
  test "PostgreSQL" do
    use_postgresql
    assert_equal (1..5).to_a, Array.new(5) { Book.create.id }
    assert_equal [2, 4, 5, 6, 7], Array.new(5) { User.create.id }
  end

  test "Mysql2" do
    use_mysql
    assert_equal (1..5).to_a, Array.new(5) { Book.create.id }
    assert_equal [2, 4, 5, 6, 7], Array.new(5) { User.create.id }
  end
end
