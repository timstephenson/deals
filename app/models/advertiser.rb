class Advertiser < ActiveRecord::Base
  has_many :deals
  belongs_to :publisher

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :publisher
end
