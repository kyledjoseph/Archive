require 'test_helper'

class MyitemsControllerTest < ActionController::TestCase
  setup do
    @myitem = myitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:myitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create myitem" do
    assert_difference('Myitem.count') do
      post :create, myitem: { current_value: @myitem.current_value, extra_notes: @myitem.extra_notes, item_recall: @myitem.item_recall, location_of_manual: @myitem.location_of_manual, price: @myitem.price, product_id: @myitem.product_id, purchase_date: @myitem.purchase_date, purchase_proof: @myitem.purchase_proof, rental_value: @myitem.rental_value, repair_locations: @myitem.repair_locations, resale_value: @myitem.resale_value }
    end

    assert_redirected_to myitem_path(assigns(:myitem))
  end

  test "should show myitem" do
    get :show, id: @myitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @myitem
    assert_response :success
  end

  test "should update myitem" do
    put :update, id: @myitem, myitem: { current_value: @myitem.current_value, extra_notes: @myitem.extra_notes, item_recall: @myitem.item_recall, location_of_manual: @myitem.location_of_manual, price: @myitem.price, product_id: @myitem.product_id, purchase_date: @myitem.purchase_date, purchase_proof: @myitem.purchase_proof, rental_value: @myitem.rental_value, repair_locations: @myitem.repair_locations, resale_value: @myitem.resale_value }
    assert_redirected_to myitem_path(assigns(:myitem))
  end

  test "should destroy myitem" do
    assert_difference('Myitem.count', -1) do
      delete :destroy, id: @myitem
    end

    assert_redirected_to myitems_path
  end
end
