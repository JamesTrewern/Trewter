require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @profile = profiles(:one)
  end

  test 'Should save valid post' do
    post = Post.new({profile: @profile, title: 'title', post_text: 'text'})
    post.save
    assert post.valid?
  end

  test 'Should not save post without title' do
    post = Post.new({profile: @profile, post_text: 'text'})
    post.save
    refute post.valid?
  end

  test 'Should not save post without profile' do
    post = Post.new({title: 'title', post_text: 'text'})
    post.save
    refute post.valid?
  end

  test 'Should not save on duplicate title' do
    post1 = Post.new({profile: @profile, title: 'title', post_text: 'text'})
    post1.save
    assert post1.valid?
    post2 = Post.new({profile: @profile, title: 'title', post_text: 'text'})
    post2.save
    refute post2.valid?
  end

  test 'should only get following posts' do
    assert Post.followed(users(:three)).include?(posts(:one))
    refute Post.followed(users(:three)).include?(posts(:two))
    refute Post.followed(users(:three)).include?(posts(:three))
  end

  test 'should only get feed posts' do
    assert Post.feed(users(:three)).include?(posts(:one))
    refute Post.feed(users(:three)).include?(posts(:two))
    assert Post.feed(users(:three)).include?(posts(:three))
  end
end
