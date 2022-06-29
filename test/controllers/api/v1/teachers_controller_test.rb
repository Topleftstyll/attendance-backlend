require "test_helper"

class Api::V1::TeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_teacher = api_v1_teachers(:one)
  end

  test "should get index" do
    get api_v1_teachers_url, as: :json
    assert_response :success
  end

  test "should create api_v1_teacher" do
    assert_difference("Api::V1::Teacher.count") do
      post api_v1_teachers_url, params: { api_v1_teacher: { group_id: @api_v1_teacher.group_id, name: @api_v1_teacher.name, user_id: @api_v1_teacher.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_teacher" do
    get api_v1_teacher_url(@api_v1_teacher), as: :json
    assert_response :success
  end

  test "should update api_v1_teacher" do
    patch api_v1_teacher_url(@api_v1_teacher), params: { api_v1_teacher: { group_id: @api_v1_teacher.group_id, name: @api_v1_teacher.name, user_id: @api_v1_teacher.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_teacher" do
    assert_difference("Api::V1::Teacher.count", -1) do
      delete api_v1_teacher_url(@api_v1_teacher), as: :json
    end

    assert_response :no_content
  end
end
