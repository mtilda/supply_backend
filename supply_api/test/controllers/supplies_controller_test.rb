require 'test_helper'

class SuppliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @supply = supplies(:one)
  end

  test "should get index" do
    get supplies_url, as: :json
    assert_response :success
  end

  test "should create supply" do
    assert_difference('Supply.count') do
      post supplies_url, params: { supply: { color: @supply.color, group_id: @supply.group_id, name: @supply.name } }, as: :json
    end

    assert_response 201
  end

  test "should show supply" do
    get supply_url(@supply), as: :json
    assert_response :success
  end

  test "should update supply" do
    patch supply_url(@supply), params: { supply: { color: @supply.color, group_id: @supply.group_id, name: @supply.name } }, as: :json
    assert_response 200
  end

  test "should destroy supply" do
    assert_difference('Supply.count', -1) do
      delete supply_url(@supply), as: :json
    end

    assert_response 204
  end
end
