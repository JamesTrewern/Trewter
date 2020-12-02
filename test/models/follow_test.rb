require 'test_helper'

class FollowTest < ActiveSupport::TestCase
  setup do
    @profile1 = profiles(:one)
    @profile2 = profiles(:two)
  end

  test "should not save empty follow" do
    follow = Follow.new
    follow.save
    refute follow.valid?
  end

  test "should not save self follow" do
    follow = Follow.new({followed: @profile1, follower: @profile1})
    follow.save
    refute follow.valid?
  end

  test "should save valid follow" do
    follow = Follow.new({followed: @profile1, follower: @profile2})
    follow.save
    assert follow.valid?
  end
end
