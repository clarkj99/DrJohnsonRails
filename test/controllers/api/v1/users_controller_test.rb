require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get profile" do
    get api_v1_profile_url
    assert_response :unauthorized
  end

  test "should get create" do
    post api_v1_users_url
    assert_response :unauthorized
  end
end
