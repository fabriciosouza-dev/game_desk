require 'test_helper'

class UserBackoffice::YieldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_backoffice_yield = user_backoffice_yields(:one)
  end

  test "should get index" do
    get user_backoffice_yields_url
    assert_response :success
  end

  test "should get new" do
    get new_user_backoffice_yield_url
    assert_response :success
  end

  test "should create user_backoffice_yield" do
    assert_difference('UserBackoffice::Yield.count') do
      post user_backoffice_yields_url, params: { user_backoffice_yield: {  } }
    end

    assert_redirected_to user_backoffice_yield_url(UserBackoffice::Yield.last)
  end

  test "should show user_backoffice_yield" do
    get user_backoffice_yield_url(@user_backoffice_yield)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_backoffice_yield_url(@user_backoffice_yield)
    assert_response :success
  end

  test "should update user_backoffice_yield" do
    patch user_backoffice_yield_url(@user_backoffice_yield), params: { user_backoffice_yield: {  } }
    assert_redirected_to user_backoffice_yield_url(@user_backoffice_yield)
  end

  test "should destroy user_backoffice_yield" do
    assert_difference('UserBackoffice::Yield.count', -1) do
      delete user_backoffice_yield_url(@user_backoffice_yield)
    end

    assert_redirected_to user_backoffice_yields_url
  end
end
