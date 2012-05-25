# coding: utf-8

FactoryGirl.define do
  factory :advertiser do
    sequence(:name) { |n| "Advertiser #{n}" }
    publisher
  end

  factory :deal do
    description "For a limited time only, Burgerville brings back a seasonal favorite: the hazelnut shake. Whipped up from local hazelnuts grown in the Willamette Valley. New for this year—chocolate hazelnut shake!"
    start_at { 1.day.ago }
    end_at { 1.week.from_now }
    price 1
    proposition "It's the time of the year for hazelnut shakes"
    value 3
    advertiser
  end

  factory :publisher do
    sequence(:name) { |n| "Publisher #{n}" }
  end
end
