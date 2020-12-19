require "application_system_test_case"

class GroupHasPicsTest < ApplicationSystemTestCase
  setup do
    @group_has_pic = group_has_pics(:one)
  end

  test "visiting the index" do
    visit group_has_pics_url
    assert_selector "h1", text: "Group Has Pics"
  end

  test "creating a Group has pic" do
    visit group_has_pics_url
    click_on "New Group Has Pic"

    fill_in "Avatar", with: @group_has_pic.avatar
    fill_in "Email", with: @group_has_pic.email
    fill_in "Group", with: @group_has_pic.group_id
    fill_in "Phone", with: @group_has_pic.phone
    fill_in "Pic name", with: @group_has_pic.pic_name
    click_on "Create Group has pic"

    assert_text "Group has pic was successfully created"
    click_on "Back"
  end

  test "updating a Group has pic" do
    visit group_has_pics_url
    click_on "Edit", match: :first

    fill_in "Avatar", with: @group_has_pic.avatar
    fill_in "Email", with: @group_has_pic.email
    fill_in "Group", with: @group_has_pic.group_id
    fill_in "Phone", with: @group_has_pic.phone
    fill_in "Pic name", with: @group_has_pic.pic_name
    click_on "Update Group has pic"

    assert_text "Group has pic was successfully updated"
    click_on "Back"
  end

  test "destroying a Group has pic" do
    visit group_has_pics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Group has pic was successfully destroyed"
  end
end
