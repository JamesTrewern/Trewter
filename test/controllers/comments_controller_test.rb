require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @comment = comments(:one)
    sign_in users(:one)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { comment_text: @comment.comment_text, post_id: @comment.post_id, profile_id: @comment.profile_id } }
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { comment_text: @comment.comment_text, post_id: @comment.post_id, profile_id: @comment.profile_id } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end
end
