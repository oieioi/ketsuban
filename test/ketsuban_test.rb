require 'test_helper'

class Ketsuban::Test < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, Ketsuban
  end

  test "PostgreSQL" do
    assert_equal (1..5).to_a, Array.new(5) { Book.create.id }
    assert_equal [2, 4, 5, 6, 7], Array.new(5) { User.create.id }
  end
end
