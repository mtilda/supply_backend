require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = items(:one)
  end

  test "should get index" do
    get items_url, as: :json
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post items_url, params: { item: { expiration: @item.expiration, is_depleted: @item.is_depleted, is_running_out: @item.is_running_out, is_tracked: @item.is_tracked, name: @item.name, supply_id: @item.supply_id, unit_id: @item.unit_id } }, as: :json
    end

    assert_response 201
  end

  test "should show item" do
    get item_url(@item), as: :json
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { expiration: @item.expiration, is_depleted: @item.is_depleted, is_running_out: @item.is_running_out, is_tracked: @item.is_tracked, name: @item.name, supply_id: @item.supply_id, unit_id: @item.unit_id } }, as: :json
    assert_response 200
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item), as: :json
    end

    assert_response 204
  end
end
