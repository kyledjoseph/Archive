require 'test_helper'

class SupercommentsControllerTest < ActionController::TestCase
  setup do
    @supercomment = supercomments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supercomments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supercomment" do
    assert_difference('Supercomment.count') do
      post :create, supercomment: { content: @supercomment.content, link: @supercomment.link, manufacturer_id: @supercomment.manufacturer_id, retailer_id: @supercomment.retailer_id }
    end

    assert_redirected_to supercomment_path(assigns(:supercomment))
  end

  test "should show supercomment" do
    get :show, id: @supercomment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supercomment
    assert_response :success
  end

  test "should update supercomment" do
    put :update, id: @supercomment, supercomment: { content: @supercomment.content, link: @supercomment.link, manufacturer_id: @supercomment.manufacturer_id, retailer_id: @supercomment.retailer_id }
    assert_redirected_to supercomment_path(assigns(:supercomment))
  end

  test "should destroy supercomment" do
    assert_difference('Supercomment.count', -1) do
      delete :destroy, id: @supercomment
    end

    assert_redirected_to supercomments_path
  end
end
