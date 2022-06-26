require "test_helper"

class Api::V1::GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_group = api_v1_groups(:one)
  end

  test "should get index" do
    get api_v1_groups_url, as: :json
    assert_response :success
  end

  test "should create api_v1_group" do
    assert_difference("Api::V1::Group.count") do
      post api_v1_groups_url, params: { api_v1_group: { children_count: @api_v1_group.children_count, name: @api_v1_group.name, note: @api_v1_group.note, user_id: @api_v1_group.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_group" do
    get api_v1_group_url(@api_v1_group), as: :json
    assert_response :success
  end

  test "should update api_v1_group" do
    patch api_v1_group_url(@api_v1_group), params: { api_v1_group: { children_count: @api_v1_group.children_count, name: @api_v1_group.name, note: @api_v1_group.note, user_id: @api_v1_group.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_group" do
    assert_difference("Api::V1::Group.count", -1) do
      delete api_v1_group_url(@api_v1_group), as: :json
    end

    assert_response :no_content
  end
end
