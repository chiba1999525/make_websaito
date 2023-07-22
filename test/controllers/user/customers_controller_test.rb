require "test_helper"

class User::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get user_customers_edit_url
    assert_response :success
  end

  test "should get show" do
    get user_customers_show_url
    assert_response :success
  end
end
