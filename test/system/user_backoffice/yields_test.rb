require "application_system_test_case"

class UserBackoffice::YieldsTest < ApplicationSystemTestCase
  setup do
    @user_backoffice_yield = user_backoffice_yields(:one)
  end

  test "visiting the index" do
    visit user_backoffice_yields_url
    assert_selector "h1", text: "User Backoffice/Yields"
  end

  test "creating a Yield" do
    visit user_backoffice_yields_url
    click_on "New User Backoffice/Yield"

    click_on "Create Yield"

    assert_text "Yield was successfully created"
    click_on "Back"
  end

  test "updating a Yield" do
    visit user_backoffice_yields_url
    click_on "Edit", match: :first

    click_on "Update Yield"

    assert_text "Yield was successfully updated"
    click_on "Back"
  end

  test "destroying a Yield" do
    visit user_backoffice_yields_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Yield was successfully destroyed"
  end
end
