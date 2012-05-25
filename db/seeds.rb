entertainment = Publisher.create!(name: "Entertainment", theme: "entertainment")
entertainment_boston = entertainment.publishers.create!(name: "Boston", theme: "entertainment-boston")
entertainment.publishers.create!(name: "New York", theme: "entertainment-new-york")
entertainment.publishers.create!(name: "Chicago", theme: "entertainment-chicago")
entertainment_pdx = entertainment.publishers.create!(name: "Portland", theme: "entertainment-pdx")

Publisher.create!(name: "OC Register", theme: "oc-register")
wcax = Publisher.create!(name: "WCAX", theme: "wcax")

advertiser = entertainment_boston.advertisers.create!(name: "Au Bon Pain")
advertiser.deals.create!(
  proposition: "Mediocre coffee with free mediocre pastry",
  value: 10,
  price: 5,
  description: "Drink coffee in Cambridge",
  start_at: 1.day.ago,
  end_at: 1.week.from_now
)

advertiser = entertainment_pdx.advertisers.create!(name: "Hot Lips Pizza")
advertiser.deals.create!(
  proposition: "Free drinks and garlic bread with large pizza",
  value: 4,
  price: 2,
  description: "Buy one of our large cheese, peperoni or sausage pizzas and add drinks and garlic bread!",
  start_at: 1.day.ago,
  end_at: 1.week.from_now
)
advertiser.deals.create!(
  proposition: "3 large pizzas",
  value: 45,
  price: 20,
  description: "Hosting a party for the big game? Everyone loves Hot Lips Pizza!",
  start_at: 2.months.from_now,
  end_at: 3.months.from_now
)
entertainment_pdx.advertisers.create!(name: "Stumptown Coffee")
entertainment_pdx.advertisers.create!(name: "Bunk Sandwiches")
entertainment_pdx.advertisers.create!(name: "Vanilla Bicycles")

# National
entertainment.advertisers.create!(name: "Disney")

advertiser = wcax.advertisers.create!(name: "South Burlington Organics")
advertiser.deals.create!(
  proposition: "Bulk food Tuesday!",
  value: 30,
  price: 10,
  description: "Buy $30 of food form the bulk bins for only $10. Tuesdays only.",
  start_at: 1.day.ago,
  end_at: 1.week.from_now
)

index = 0
100.times do
  advertiser = wcax.advertisers.create!(name: "Vermont Business #{index}")
  advertiser.deals.create!(
    proposition: "Great Deal",
    value: 20,
    price: 5,
    description: "Buy now",
    start_at: 1.day.ago,
    end_at: 1.week.from_now
  )
  advertiser.deals.create!(
    proposition: "Great Deal",
    value: 20,
    price: 5,
    description: "Buy now",
    start_at: 2.weeks.from_now,
    end_at: 3.week.from_now
  )
  advertiser.deals.create!(
    proposition: "Great Deal",
    value: 20,
    price: 5,
    description: "Buy now",
    start_at: 4.weeks.from_now,
    end_at: 5.week.from_now
  )
  index = index + 1
end
