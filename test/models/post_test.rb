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
end
