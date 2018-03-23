require 'test_helper'

class BanksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get banks_show_url
    assert_response :success
  end

end
