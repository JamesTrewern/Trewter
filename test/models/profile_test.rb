require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can not save empty profile" do
    profile = Profile.new
    profile.save
    refute profile.valid?
  end

  test "can save complete profile" do
    profile = Profile.new(first_name: "james",
                            surname: "trewern",
                            email: "trewern.james@gmail.com",
                            email_confirmation: "trewern.james@gmail.com",
                            password: "test",
                            dob: Date::strptime("10-12-1999", "%d-%m-%Y"))
    profile.save
    assert profile.valid?
  end

  test "can't save non unique email" do
    profile = Profile.new(first_name: "james",
                            surname: "trewern",
                            email: "trewern.james@gmail.com",
                            email_confirmation: "trewern.james@gmail.com",
                            password: "test",
                            dob: Date::strptime("10-12-1999", "%d-%m-%Y"))
    profile.save
    profile2 = Profile.new(first_name: "j",
                            surname: "t",
                            email: "trewern.james@gmail.com",
                            email_confirmation: "trewern.james@gmail.com",
                            password: "test1",
                            dob: Date::strptime("10-12-1998", "%d-%m-%Y"))
    profile2.save
  refute profile2.valid?
  end

  test "can't save incorrectly formatted email" do
    profile = Profile.new(first_name: "james",
                            surname: "trewern",
                            email: "trewern.james.gmail.com",
                            email_confirmation: "trewern.james.gmail.com",
                            password: "test",
                            dob: Date::strptime("10-12-1999", "%d-%m-%Y"))
    profile.save
    refute profile.valid?
  end
end
