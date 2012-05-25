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
end
