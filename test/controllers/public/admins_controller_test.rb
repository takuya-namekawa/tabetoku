require "test_helper"

class Public::AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_admins_index_url
    assert_response :success
  end

  test "should get show" do
    get public_admins_show_url
    assert_response :success
  end
end
