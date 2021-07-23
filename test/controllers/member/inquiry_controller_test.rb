require 'test_helper'

class Member::InquiryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get member_inquiry_index_url
    assert_response :success
  end

  test "should get conform" do
    get member_inquiry_conform_url
    assert_response :success
  end

  test "should get thanks" do
    get member_inquiry_thanks_url
    assert_response :success
  end

end
