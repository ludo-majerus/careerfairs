require 'test_helper'

class CompanytoeventsControllerTest < ActionController::TestCase
  setup do
    @companytoevent = companytoevents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companytoevents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create companytoevent" do
    assert_difference('Companytoevent.count') do
      post :create, companytoevent: { company_id: @companytoevent.company_id, event_id: @companytoevent.event_id }
    end

    assert_redirected_to companytoevent_path(assigns(:companytoevent))
  end

  test "should show companytoevent" do
    get :show, id: @companytoevent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @companytoevent
    assert_response :success
  end

  test "should update companytoevent" do
    put :update, id: @companytoevent, companytoevent: { company_id: @companytoevent.company_id, event_id: @companytoevent.event_id }
    assert_redirected_to companytoevent_path(assigns(:companytoevent))
  end

  test "should destroy companytoevent" do
    assert_difference('Companytoevent.count', -1) do
      delete :destroy, id: @companytoevent
    end

    assert_redirected_to companytoevents_path
  end
end
