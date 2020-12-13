require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  test "should not save empty comment" do
    comment = Comment.new()
    comment.save
    refute comment.valid?
  end

  test "should save valid comment" do
    comment = Comment.new({post: posts(:one), profile: profiles(:one), comment_text: "Lorem ipsum dolor siatat non proident, sunt in culpa qui officia deserunt mollit anim id ."})
    comment.save
    assert comment.valid?
  end
end
