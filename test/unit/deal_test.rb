require 'test_helper'

class DealTest < ActiveSupport::TestCase
  test "factory should be sane" do
    assert FactoryGirl.build(:deal).valid?
  end

  # I think this is a bad test and it fails sometimes
  test "over should honor current time" do
  	deal = FactoryGirl.create(:deal, :end_at => Time.zone.now + 0.01)
  	assert !deal.over?, "Deal should not be over"
  	sleep 1
  	assert deal.over?, "Deal should be over"
  end
  
  test "with_advertisers scope should include advertisers and publishers" do
    assert_equal [{:advertiser=>[:publisher]}], Deal.with_advertisers.includes_values
  end
end
