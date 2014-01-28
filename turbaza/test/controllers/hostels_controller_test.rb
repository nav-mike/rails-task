require 'test_helper'

class HostelsControllerTest < ActionController::TestCase
  setup do
    @hostel = hostels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hostels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hostel" do
    assert_difference('Hostel.count') do
      post :create, hostel: { address: @hostel.address, city_id: @hostel.city_id, description: @hostel.description, email: @hostel.email, name: @hostel.name, phone: @hostel.phone, photo_string: @hostel.photo_string }
    end

    assert_redirected_to hostel_path(assigns(:hostel))
  end

  test "should show hostel" do
    get :show, id: @hostel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hostel
    assert_response :success
  end

  test "should update hostel" do
    patch :update, id: @hostel, hostel: { address: @hostel.address, city_id: @hostel.city_id, description: @hostel.description, email: @hostel.email, name: @hostel.name, phone: @hostel.phone, photo_string: @hostel.photo_string }
    assert_redirected_to hostel_path(assigns(:hostel))
  end

  test "should destroy hostel" do
    assert_difference('Hostel.count', -1) do
      delete :destroy, id: @hostel
    end

    assert_redirected_to hostels_path
  end
end
