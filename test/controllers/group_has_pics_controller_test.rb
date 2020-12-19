require "test_helper"

class GroupHasPicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_has_pic = group_has_pics(:one)
  end

  test "should get index" do
    get group_has_pics_url
    assert_response :success
  end

  test "should get new" do
    get new_group_has_pic_url
    assert_response :success
  end

  test "should create group_has_pic" do
    assert_difference('GroupHasPic.count') do
      post group_has_pics_url, params: { group_has_pic: { avatar: @group_has_pic.avatar, email: @group_has_pic.email, group_id: @group_has_pic.group_id, phone: @group_has_pic.phone, pic_name: @group_has_pic.pic_name } }
    end

    assert_redirected_to group_has_pic_url(GroupHasPic.last)
  end

  test "should show group_has_pic" do
    get group_has_pic_url(@group_has_pic)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_has_pic_url(@group_has_pic)
    assert_response :success
  end

  test "should update group_has_pic" do
    patch group_has_pic_url(@group_has_pic), params: { group_has_pic: { avatar: @group_has_pic.avatar, email: @group_has_pic.email, group_id: @group_has_pic.group_id, phone: @group_has_pic.phone, pic_name: @group_has_pic.pic_name } }
    assert_redirected_to group_has_pic_url(@group_has_pic)
  end

  test "should destroy group_has_pic" do
    assert_difference('GroupHasPic.count', -1) do
      delete group_has_pic_url(@group_has_pic)
    end

    assert_redirected_to group_has_pics_url
  end
end
