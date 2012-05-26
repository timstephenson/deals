require 'test_helper'

class TransporterTest < ActiveSupport::TestCase
  setup do
    @transporter = Transporter.new("daily_planet_export.txt")
    @publisher = Publisher.find_or_create_by_name("The Daily Planet")
  end
  
  test "should not be nil" do
    assert @transporter
  end
  
  test "should transport data to a publisher" do
    @transporter.transport_to_publisher(@publisher) 
    assert @publisher.advertisers.length == 3, "Should created 3 adversisers" 
  end
  
  test "should create a deal for each advertiser" do
    @transporter.transport_to_publisher(@publisher) 
    @publisher.advertisers.each do |advertiser|
      assert advertiser.deals.first.valid?, "Should create a valid deal for #{advertiser.name}"
    end
  end
  
end
