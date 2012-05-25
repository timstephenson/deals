require 'test_helper'

class PublisherTest < ActiveSupport::TestCase
  test "can't have self as parent" do
    publisher = FactoryGirl.create(:publisher)
    assert publisher.valid?

    publisher.parent = publisher
    assert !publisher.valid?

    second_publisher = FactoryGirl.create(:publisher)
    publisher.parent = second_publisher
    assert publisher.valid?

    publisher.save!
  end
  
  test "should set theme to entertainment" do
    publisher = Factory(:publisher)
    publisher.theme = "entertainment-boston"
    assert_equal "entertainment", publisher.entertainment_or_default_theme
  end
  
  test "should return default theme value" do
    publisher = Factory(:publisher)
    publisher.theme = "some-theme-boston"
    assert_equal "some-theme-boston", publisher.entertainment_or_default_theme
  end
end
