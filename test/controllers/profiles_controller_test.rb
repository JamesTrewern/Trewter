require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:one)
    @profile = profiles(:one)
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should get new" do
    sign_in users(:four)
    get new_profile_url
    assert_response :success
  end

  test "should create profile" do
    sign_in users(:four)
    assert_difference('Profile.count') do
      post profiles_url, params: { profile: {dob: @profile.dob, first_name: @profile.first_name, surname: @profile.surname } }
    end

    assert_redirected_to profile_url(Profile.last)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { bio: @profile.bio, dob: @profile.dob, first_name: @profile.first_name, picture_url: @profile.picture_url, surname: @profile.surname } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
