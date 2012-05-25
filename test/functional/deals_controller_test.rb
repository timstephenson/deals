require 'test_helper'

class DealsControllerTest < ActionController::TestCase
  test "should get index" do
    FactoryGirl.create_list(:deal, 10)
    get :index
    assert_response :success
    assert_not_nil assigns(:deals)
  end

  test "should get new" do
    advertiser = FactoryGirl.create(:advertiser)
    get :new, :advertiser_id => advertiser.id
    assert_response :success
  end

  test "should create deal" do
    assert_difference('Deal.count') do
      post :create, deal: FactoryGirl.attributes_for(:deal), :advertiser_id => FactoryGirl.create(:advertiser).id
    end

    assert_redirected_to edit_deal_path(assigns(:deal))
  end

  test "should show deal" do
    get :show, id: FactoryGirl.create(:deal).to_param
    assert_response :success
    assert_template "layouts/deals/show"
  end

  test "should use themed template to show deal" do
    publisher = FactoryGirl.create(:publisher, theme: "wcax")
    advertiser = FactoryGirl.create(:advertiser, publisher: publisher)
    get :show, id: FactoryGirl.create(:deal, advertiser: advertiser).to_param
    assert_response :success
    assert_select "h1", text: "Jump On It"
  end

  test "should get edit" do
    get :edit, id: FactoryGirl.create(:deal).to_param
    assert_response :success
  end

  test "should update deal" do
    deal = FactoryGirl.create(:deal)
    put :update, id: deal, deal: { price: 30 }
    assert_redirected_to edit_deal_path(deal)
  end

  test "should destroy deal" do
    deal = FactoryGirl.create(:deal)
    assert_difference('Deal.count', -1) do
      delete :destroy, id: deal
    end

    assert_redirected_to deals_path
  end
end
