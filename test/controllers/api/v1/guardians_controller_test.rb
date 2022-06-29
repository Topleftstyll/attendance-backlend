require "test_helper"

class Api::V1::GuardiansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_guardian = api_v1_guardians(:one)
  end

  test "should get index" do
    get api_v1_guardians_url, as: :json
    assert_response :success
  end

  test "should create api_v1_guardian" do
    assert_difference("Api::V1::Guardian.count") do
      post api_v1_guardians_url, params: { api_v1_guardian: { child_id: @api_v1_guardian.child_id, email: @api_v1_guardian.email, name: @api_v1_guardian.name, phone_number: @api_v1_guardian.phone_number } }, as: :json
    end

    assert_response :created
  end

  test "should show api_v1_guardian" do
    get api_v1_guardian_url(@api_v1_guardian), as: :json
    assert_response :success
  end

  test "should update api_v1_guardian" do
    patch api_v1_guardian_url(@api_v1_guardian), params: { api_v1_guardian: { child_id: @api_v1_guardian.child_id, email: @api_v1_guardian.email, name: @api_v1_guardian.name, phone_number: @api_v1_guardian.phone_number } }, as: :json
    assert_response :success
  end

  test "should destroy api_v1_guardian" do
    assert_difference("Api::V1::Guardian.count", -1) do
      delete api_v1_guardian_url(@api_v1_guardian), as: :json
    end

    assert_response :no_content
  end
end
