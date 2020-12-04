require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  setup do
    @user = User.new({email: 'james@example.com', password: '123abcd'})
    @user.save
  end


  test "should save valid profile" do
    profile = Profile.new({first_name: 'James', surname: 'Trewern', dob: Date::strptime("10-12-1999", "%d-%m-%Y"), user: @user})
    profile.save
    assert profile.valid?
  end

  test "should not save empty profile" do
    profile = Profile.new
    profile.save
    refute profile.valid?
  end

  test "should not save profiles with same user" do
    profile1 = Profile.new({first_name: 'James', surname: 'Trewern', dob: Date::strptime("10-12-1999", "%d-%m-%Y"), user: @user})
    profile1.save
    profile2 = Profile.new({first_name: 'Jack', surname: 'Trewern', dob: Date::strptime("11-12-1999", "%d-%m-%Y"), user: @user})
    profile2.save
    refute profile2.valid?
  end

  test "should get profile from user" do
    user = users(:one)
    profile = profiles(:one)
    assert user.profile == profiles(:one)
  end

  test "should return followed" do
    assert profiles(:one).followed.include? profiles(:two)
  end

  test "should not return not followed" do
    profile1 = Profile.new({first_name: 'James', surname: 'Trewern', dob: Date::strptime("10-12-1999", "%d-%m-%Y"), user: @user})
    profile1.save
    refute profiles(:one).followed.include? profile1
  end

  test "should not save invalid name format" do
    profile = Profile.new({first_name: '1233', surname: '3333', dob: Date::strptime("10-12-1999", "%d-%m-%Y"), user: @user})
    profile.save
    refute profile.valid?
  end

  test "should not save short name" do
    profile = Profile.new({first_name: 'A', surname: 'Aaaaa', dob: Date::strptime("10-12-1999", "%d-%m-%Y"), user: @user})
    profile.save
    refute profile.valid?
  end

  test "should not save long name" do
    profile = Profile.new({first_name: 'Aaaaaaaaaaaaaaaaaaaaa', surname: 'Aaaaa', dob: Date::strptime("10-12-1999", "%d-%m-%Y"), user: @user})
    profile.save
    refute profile.valid?
  end

  test "should not save long bio" do
    profile = Profile.new({first_name: 'Aaaaaaaaaaaaaaaaaaaaa', surname: 'Aaaaa', dob: Date::strptime("10-12-1999", "%d-%m-%Y"), user: @user})
    profile.bio = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse maximus velit eu mauris ullamcorper iaculis ac tristique purus. Duis sagittis fringilla nisi, quis tempor metus cursus sed. Suspendisse faucibus varius nibh, vel accumsan mi dapibus in. In pharetra augue leo, ac luctus sapien porttitor ac. Integer erat massa, dapibus quis. "
    profile.save
    refute profile.valid?
  end

end
