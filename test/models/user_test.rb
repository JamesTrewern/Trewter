require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'Should not save invalid user' do
    user = User.new
    user.save
    refute user.valid?
  end

  test 'Should save valid user' do
    user = User.new
    user.email = 'james@example.com'
    user.password = '123abcd'
    user.save
    assert user.valid?
  end
end
