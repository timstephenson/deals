class Deal < ActiveRecord::Base
  belongs_to :advertiser
  
  delegate :publisher, to: :advertiser, prefix: true
  delegate :name, to: :advertiser_publisher, prefix: true
  
  # Scopes ===========================================================================
  scope :with_advertisers, includes([:advertiser => [:publisher]])
  
  # Valications ======================================================================
  validates_presence_of :advertiser, :value, :price, :description, :start_at, :end_at

  def over?
    Time.zone.now > end_at
  end

  def savings_as_percentage
    0.5
  end

  def savings
    20
  end
end
