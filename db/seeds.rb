# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    user = User.find_by(email: 'trewern.james@gmail.com')
    unless user
      user = User.new
      user.email = "trewern.james@gmail.com"
      user.password = "123abcd"
      user.password_confirmation = "123abcd"
      user.save
    end

    profile = Profile.where(first_name: 'James').where(surname: 'Trewern').first
    unless profile
      profile = Profile.new({first_name: 'James', surname: 'Trewern', dob: Date::strptime("10-12-1999", "%d-%m-%Y"), user: user})
      profile.save
    end

    post1 = Post.where(title: 'welcome to trewter').first
    unless post1
      post1 = Post.new({title: 'welcome to trewter', post_text: "example post text", profile: profile})
      post1.save
    end

    post2 = Post.where(title: 'second example post').first
    unless post1
      post1 = Post.new({title: 'second example post', post_text: "example post text again", profile: profile})
      post1.save
    end
