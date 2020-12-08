# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    user1 = User.find_by(email: 'trewern.james@gmail.com')
    unless user1
      user1 = User.new
      user1.email = "trewern.james@gmail.com"
      user1.password = "123abcd"
      user1.password_confirmation = "123abcd"
      user1.save
    end

    user2 = User.find_by(email: 'trewern.jack@gmail.com')
    unless user2
      user2 = User.new
      user2.email = "trewern.jack@gmail.com"
      user2.password = "123abcd"
      user2.password_confirmation = "123abcd"
      user2.save
    end

    profile1 = Profile.where(first_name: 'James').where(surname: 'Trewern').first
    unless profile1
      profile1 = Profile.new({first_name: 'James', surname: 'Trewern', dob: Date::strptime("10-12-1999", "%d-%m-%Y"), user: user1})
      profile1.save
    end

    profile2 = Profile.where(first_name: 'Jack').where(surname: 'Trewern').first
    unless profile2
      profile2 = Profile.new({first_name: 'Jack', surname: 'Trewern', dob: Date::strptime("11-12-1999", "%d-%m-%Y"), user: user2})
      profile1.save
    end

    follow1 = Follow.where(follower: profile2).where(followed: profile1).first
    unless follow1
      follow1 = Follow.new({followed: profile1, follower: profile2})
      follow1.save
    end

    post1 = Post.where(title: 'welcome to trewter').first
    unless post1
      post1 = Post.new({title: 'welcome to trewter', post_text: "example post text", profile: profile1})
      post1.save
    end

    post2 = Post.where(title: 'second example post').first
    unless post2
      post2 = Post.new({title: 'second example post', post_text: "example post text again", profile: profile2})
      post2.save
    end

    comment1_1 = Comment.where(post: post1).where(comment_text: 'test comment 1').where(profile: profile2)
    unless comment1_1
      comment1_1 = Comment.new({post: post1, comment_text: 'test comment 1', profile: profile2})

      comment1_1.save

      puts comment1_1.id
    end
