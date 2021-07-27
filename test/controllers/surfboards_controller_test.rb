require 'test_helper'

class SurfboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get surfboards_index_url
    assert_response :success
  end

  test "should get show" do
    get surfboards_show_url
    assert_response :success
  end

  test "should get new" do
    get surfboards_new_url
    assert_response :success
  end

  test "should get edit" do
    get surfboards_edit_url
    assert_response :success
  end

end
