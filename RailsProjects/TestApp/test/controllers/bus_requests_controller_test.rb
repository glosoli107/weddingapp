require 'test_helper'

class BusRequestsControllerTest < ActionController::TestCase
  setup do
    @bus_request = bus_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bus_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bus_request" do
    assert_difference('BusRequest.count') do
      post :create, bus_request: { names: @bus_request.names, number_of_seats: @bus_request.number_of_seats }
    end

    assert_redirected_to bus_request_path(assigns(:bus_request))
  end

  test "should show bus_request" do
    get :show, id: @bus_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bus_request
    assert_response :success
  end

  test "should update bus_request" do
    patch :update, id: @bus_request, bus_request: { names: @bus_request.names, number_of_seats: @bus_request.number_of_seats }
    assert_redirected_to bus_request_path(assigns(:bus_request))
  end

  test "should destroy bus_request" do
    assert_difference('BusRequest.count', -1) do
      delete :destroy, id: @bus_request
    end

    assert_redirected_to bus_requests_path
  end
end
