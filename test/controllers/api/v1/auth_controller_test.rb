require "test_helper"

class Api::V1::AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    post api_v1_auth_url
    assert_response :success
  end
end
