require 'test_helper'

class AdvertisersControllerTest < ActionController::TestCase
  test "should get index" do
    publisher = FactoryGirl.create(:publisher)
    advertiser = FactoryGirl.create(:advertiser, publisher: publisher)

    # another publisher's advertisers
    FactoryGirl.create(:advertiser)

    get :index, :publisher_id => publisher.to_param
    assert_response :success
    assert_equal [ advertiser ], assigns(:advertisers), "Should show only current publisher's advertisers"
  end

  test "should get new" do
    publisher = FactoryGirl.create(:publisher)
    get :new, :publisher_id => publisher.to_param
    assert_response :success
  end

  test "should create advertiser" do
    publisher = FactoryGirl.create(:publisher)
    assert_difference('Advertiser.count') do
      post :create, advertiser: FactoryGirl.attributes_for(:advertiser, publisher_id: publisher.id)
    end

    assert_redirected_to edit_advertiser_path(assigns(:advertiser))
  end

  test "should get edit" do
    advertiser = FactoryGirl.create(:advertiser)
    get :edit, id: advertiser
    assert_response :success
  end

  test "should update advertiser" do
    advertiser = FactoryGirl.create(:advertiser)
    put :update, id: advertiser, advertiser: advertiser.attributes
    assert_redirected_to edit_advertiser_path(assigns(:advertiser))
  end

  test "should destroy advertiser" do
    advertiser = FactoryGirl.create(:advertiser)
    assert_difference('Advertiser.count', -1) do
      delete :destroy, id: advertiser
    end

    assert_redirected_to publisher_advertisers_path(advertiser.publisher)
  end
end
