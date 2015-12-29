require 'test_helper'

class WhiteLabelsControllerTest < ActionController::TestCase
  setup do
    @white_label = white_labels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:white_labels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create white_label" do
    assert_difference('WhiteLabel.count') do
      post :create, white_label: {  }
    end

    assert_redirected_to white_label_path(assigns(:white_label))
  end

  test "should show white_label" do
    get :show, id: @white_label
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @white_label
    assert_response :success
  end

  test "should update white_label" do
    patch :update, id: @white_label, white_label: {  }
    assert_redirected_to white_label_path(assigns(:white_label))
  end

  test "should destroy white_label" do
    assert_difference('WhiteLabel.count', -1) do
      delete :destroy, id: @white_label
    end

    assert_redirected_to white_labels_path
  end
end
