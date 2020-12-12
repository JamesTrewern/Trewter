require 'test_helper'

class FollowsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in(users(:two))
  end

  test "should create follow" do
    assert_difference('Follow.count') do
      post follows_url, params: { follow: { followed_id: profiles(:three).id, follower_id: profiles(:two).id } }, xhr:true
    end
  end

  test "should destroy follow" do
    assert_difference('Follow.count', -1) do
      delete follow_url(follows(:one)), xhr: true
    end
  end
end
