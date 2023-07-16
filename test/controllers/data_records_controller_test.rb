require "test_helper"

class DataRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get data_records_index_url
    assert_response :success
  end

  test "should get show" do
    get data_records_show_url
    assert_response :success
  end

  test "should get edit" do
    get data_records_edit_url
    assert_response :success
  end

  test "should get update" do
    get data_records_update_url
    assert_response :success
  end
end
