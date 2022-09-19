require "test_helper"

class DanceClassesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dance_classes_index_url
    assert_response :success
  end

  test "should get show" do
    get dance_classes_show_url
    assert_response :success
  end

  test "should get new" do
    get dance_classes_new_url
    assert_response :success
  end

  test "should get create" do
    get dance_classes_create_url
    assert_response :success
  end

  test "should get edit" do
    get dance_classes_edit_url
    assert_response :success
  end

  test "should get update" do
    get dance_classes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dance_classes_destroy_url
    assert_response :success
  end
end
