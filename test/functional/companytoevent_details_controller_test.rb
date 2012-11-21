require 'test_helper'

class CompanytoeventDetailsControllerTest < ActionController::TestCase
  setup do
    @companytoevent_detail = companytoevent_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companytoevent_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create companytoevent_detail" do
    assert_difference('CompanytoeventDetail.count') do
      post :create, companytoevent_detail: { companytoevent_id: @companytoevent_detail.companytoevent_id, key: @companytoevent_detail.key, value: @companytoevent_detail.value }
    end

    assert_redirected_to companytoevent_detail_path(assigns(:companytoevent_detail))
  end

  test "should show companytoevent_detail" do
    get :show, id: @companytoevent_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @companytoevent_detail
    assert_response :success
  end

  test "should update companytoevent_detail" do
    put :update, id: @companytoevent_detail, companytoevent_detail: { companytoevent_id: @companytoevent_detail.companytoevent_id, key: @companytoevent_detail.key, value: @companytoevent_detail.value }
    assert_redirected_to companytoevent_detail_path(assigns(:companytoevent_detail))
  end

  test "should destroy companytoevent_detail" do
    assert_difference('CompanytoeventDetail.count', -1) do
      delete :destroy, id: @companytoevent_detail
    end

    assert_redirected_to companytoevent_details_path
  end
end
