require 'test_helper'

class UserBackoffice::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_backoffice_homes_index_url
    assert_response :success
  end

end
