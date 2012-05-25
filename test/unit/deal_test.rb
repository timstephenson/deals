require 'test_helper'
require 'timecop'

class DealTest < ActiveSupport::TestCase
  test "factory should be sane" do
    assert FactoryGirl.build(:deal).valid?
  end

  # I think this is a bad test and it fails sometimes
  test "over should honor current time" do
    Timecop.travel(Time.local(2012, 1, 15, 10, 0, 0))
  	deal = FactoryGirl.create(:deal, :end_at => Time.zone.now + 1.day)
  	assert !deal.over?, "Deal should not be over"
  	Timecop.travel(Time.local(2012, 1, 16, 12, 0, 0))
  	assert deal.over?, "Deal should be over"
  end
  
  test "with_advertisers scope should include advertisers and publishers" do
    assert_equal [{:advertiser=>[:publisher]}], Deal.with_advertisers.includes_values
  end
end
