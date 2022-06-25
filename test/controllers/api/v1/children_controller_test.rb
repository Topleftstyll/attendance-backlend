require "test_helper"

class Api::V1::ChildrenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_child = api_v1_children(:one)
  end

  test "should get index" do
    get api_v1_children_url, as: :json
    assert_response :success
  end

  test "should create api_v1_child" do
    assert_difference("Api::V1::Child.count") do
      post api_v1_children_url, params: { api_v1_child: { attendance_id: @api_v1_child.attendance_id, first_name: @api_v1_child.first_name, last_name: @api_v1_child.last_name, teacher_id: @api_v1_child.teacher_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_child" do
    get api_v1_child_url(@api_v1_child), as: :json
    assert_response :success
  end

  test "should update api_v1_child" do
    patch api_v1_child_url(@api_v1_child), params: { api_v1_child: { attendance_id: @api_v1_child.attendance_id, first_name: @api_v1_child.first_name, last_name: @api_v1_child.last_name, teacher_id: @api_v1_child.teacher_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_child" do
    assert_difference("Api::V1::Child.count", -1) do
      delete api_v1_child_url(@api_v1_child), as: :json
    end

    assert_response :no_content
  end
end
