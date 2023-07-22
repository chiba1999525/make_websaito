require "test_helper"

class AdminGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_genres_index_url
    assert_response :success
  end
end
