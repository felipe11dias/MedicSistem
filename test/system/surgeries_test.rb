require "application_system_test_case"

class SurgeriesTest < ApplicationSystemTestCase
  setup do
    @surgery = surgeries(:one)
  end

  test "visiting the index" do
    visit surgeries_url
    assert_selector "h1", text: "Surgeries"
  end

  test "creating a Surgery" do
    visit surgeries_url
    click_on "New Surgery"

    fill_in "Clients", with: @surgery.clients_id
    fill_in "Date Hours", with: @surgery.date_hours
    fill_in "Doctors", with: @surgery.doctors_id
    fill_in "Feedback", with: @surgery.feedback
    fill_in "Rooms", with: @surgery.rooms_id
    click_on "Create Surgery"

    assert_text "Surgery was successfully created"
    click_on "Back"
  end

  test "updating a Surgery" do
    visit surgeries_url
    click_on "Edit", match: :first

    fill_in "Clients", with: @surgery.clients_id
    fill_in "Date Hours", with: @surgery.date_hours
    fill_in "Doctors", with: @surgery.doctors_id
    fill_in "Feedback", with: @surgery.feedback
    fill_in "Rooms", with: @surgery.rooms_id
    click_on "Update Surgery"

    assert_text "Surgery was successfully updated"
    click_on "Back"
  end

  test "destroying a Surgery" do
    visit surgeries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Surgery was successfully destroyed"
  end
end
