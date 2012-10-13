require 'test_helper'

class WishitemsControllerTest < ActionController::TestCase
  setup do
    @wishitem = wishitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wishitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wishitem" do
    assert_difference('Wishitem.count') do
      post :create, wishitem: { product_id: @wishitem.product_id }
    end

    assert_redirected_to wishitem_path(assigns(:wishitem))
  end

  test "should show wishitem" do
    get :show, id: @wishitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wishitem
    assert_response :success
  end

  test "should update wishitem" do
    put :update, id: @wishitem, wishitem: { product_id: @wishitem.product_id }
    assert_redirected_to wishitem_path(assigns(:wishitem))
  end

  test "should destroy wishitem" do
    assert_difference('Wishitem.count', -1) do
      delete :destroy, id: @wishitem
    end

    assert_redirected_to wishitems_path
  end
end
