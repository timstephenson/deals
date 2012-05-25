require "test_helper"

class AdvertiserTest < ActiveSupport::TestCase
  test "constraints" do
    FactoryGirl.create(:advertiser, :name => "Burgerville")

    publisher = FactoryGirl.create(:publisher)
    advertiser = publisher.advertisers.build(:name => "Burgerville")
    assert !advertiser.valid?, "Should not allow duplicate names"

    advertiser.name = "In N' Out Burger"
    assert advertiser.valid?, "Should allow multiple advertisers with unique names"
  end
end
