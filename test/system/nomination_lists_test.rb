require "application_system_test_case"

class NominationListsTest < ApplicationSystemTestCase
  setup do
    @nomination_list = nomination_lists(:one)
  end

  test "visiting the index" do
    visit nomination_lists_url
    assert_selector "h1", text: "Nomination Lists"
  end

  test "creating a Nomination list" do
    visit nomination_lists_url
    click_on "New Nomination List"

    fill_in "Token", with: @nomination_list.token
    click_on "Create Nomination list"

    assert_text "Nomination list was successfully created"
    click_on "Back"
  end

  test "updating a Nomination list" do
    visit nomination_lists_url
    click_on "Edit", match: :first

    fill_in "Token", with: @nomination_list.token
    click_on "Update Nomination list"

    assert_text "Nomination list was successfully updated"
    click_on "Back"
  end

  test "destroying a Nomination list" do
    visit nomination_lists_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nomination list was successfully destroyed"
  end
end
