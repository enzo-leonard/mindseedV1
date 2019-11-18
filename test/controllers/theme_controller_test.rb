require 'test_helper'

class ThemeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get theme_index_url
    assert_response :success
  end

  test "should get new" do
    get theme_new_url
    assert_response :success
  end

  test "should get create" do
    get theme_create_url
    assert_response :success
  end

  test "should get edit" do
    get theme_edit_url
    assert_response :success
  end

  test "should get update" do
    get theme_update_url
    assert_response :success
  end

  test "should get delete" do
    get theme_delete_url
    assert_response :success
  end

end
