require 'test_helper'

class NewMessagesControllerTest < ActionController::TestCase
  setup do
    @new_message = new_messages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:new_messages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create new_message" do
    assert_difference('NewMessage.count') do
      post :create, new_message: { user_email: @new_message.user_email, user_message: @new_message.user_message, user_name: @new_message.user_name }
    end

    assert_redirected_to new_message_path(assigns(:new_message))
  end

  test "should show new_message" do
    get :show, id: @new_message
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @new_message
    assert_response :success
  end

  test "should update new_message" do
    patch :update, id: @new_message, new_message: { user_email: @new_message.user_email, user_message: @new_message.user_message, user_name: @new_message.user_name }
    assert_redirected_to new_message_path(assigns(:new_message))
  end

  test "should destroy new_message" do
    assert_difference('NewMessage.count', -1) do
      delete :destroy, id: @new_message
    end

    assert_redirected_to new_messages_path
  end
end
