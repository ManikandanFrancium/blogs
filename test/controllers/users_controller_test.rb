require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    user = User.create(username: 'example', email: 'example@example.com')
    get user_url(user)
    assert_response :success
  end

  test 'should assign the requested user to @user' do
    user = User.create(username: 'example', email: 'example@example.com')
    get user_url(user)
    assert_equal user, assigns(:user)
  end

  # Add more test cases as needed
end