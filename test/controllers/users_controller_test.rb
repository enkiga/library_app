require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get signup page" do
    get signup_path
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post signup_path, params: {
        user: {
          name: "New User",
          email: "new@example.com",
          password: "password",
          password_confirmation: "password"
        }
      }
    end
    assert_redirected_to root_path
  end

  test "should not create invalid user" do
    assert_no_difference("User.count") do
      post signup_path, params: {
        user: {
          name: "",
          email: "invalid",
          password: "short",
          password_confirmation: "short"
        }
      }
    end
    assert_response :unprocessable_entity
  end
end
