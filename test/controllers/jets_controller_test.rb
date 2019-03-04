require 'test_helper'

class JetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jets_index_url
    assert_response :success
  end

  test "should get show" do
    get jets_show_url
    assert_response :success
  end

  test "should get new" do
    get jets_new_url
    assert_response :success
  end

  test "should get create" do
    get jets_create_url
    assert_response :success
  end

  test "should get edit" do
    get jets_edit_url
    assert_response :success
  end

  test "should get update" do
    get jets_update_url
    assert_response :success
  end

  test "should get delete" do
    get jets_delete_url
    assert_response :success
  end

end
