require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @profile = profiles(:one)
  end

  test "can not save empty post" do
    post = Post.new
    post.save
    refute post.valid?
  end

  test "can save valid post" do
    post = Post.new
    post.profile = @profile
    assert post.valid?
  end
end
