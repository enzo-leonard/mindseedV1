require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cards_index_url
    assert_response :success
  end

  test "should get show" do
    get cards_show_url
    assert_response :success
  end

  test "should get new" do
    get cards_new_url
    assert_response :success
  end

  test "should get create" do
    get cards_create_url
    assert_response :success
  end

  test "should get edit" do
    get cards_edit_url
    assert_response :success
  end

  test "should get update" do
    get cards_update_url
    assert_response :success
  end

  test "should get delete" do
    get cards_delete_url
    assert_response :success
  end

end
