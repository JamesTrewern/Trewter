require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @comment = comments(:one)
    sign_in users(:one)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, xhr: true,  params: { comment: { comment_text: @comment.comment_text, post_id: @comment.post_id, profile_id: @comment.profile_id } }
    end
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), xhr: true , params: { comment: { comment_text: @comment.comment_text, post_id: @comment.post_id, profile_id: @comment.profile_id } }
    assert_response :success
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment), xhr: true
    end
    assert_response :success
  end
end
