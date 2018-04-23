require 'test_helper'

class RechargesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recharge = recharges(:one)
  end

  test "should get index" do
    get recharges_url
    assert_response :success
  end

  test "should get new" do
    get new_recharge_url
    assert_response :success
  end

  test "should create recharge" do
    assert_difference('Recharge.count') do
      post recharges_url, params: { recharge: { card_id: @recharge.card_id, value: @recharge.value } }
    end

    assert_redirected_to recharge_url(Recharge.last)
  end

  test "should show recharge" do
    get recharge_url(@recharge)
    assert_response :success
  end

  test "should get edit" do
    get edit_recharge_url(@recharge)
    assert_response :success
  end

  test "should update recharge" do
    patch recharge_url(@recharge), params: { recharge: { card_id: @recharge.card_id, value: @recharge.value } }
    assert_redirected_to recharge_url(@recharge)
  end

  test "should destroy recharge" do
    assert_difference('Recharge.count', -1) do
      delete recharge_url(@recharge)
    end

    assert_redirected_to recharges_url
  end
end
