require "test_helper"

class DatabaseControllerTest < ActionDispatch::IntegrationTest
  test "should get connect" do
    get database_connect_url
    assert_response :success
  end

  test "should get disconnect" do
    get database_disconnect_url
    assert_response :success
  end
end
