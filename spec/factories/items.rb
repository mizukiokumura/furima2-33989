FactoryBot.define do
  factory :item do
    name { Faker::DcComics.title}
    item_description {Faker::Books::Lovecraft.sentence}
    category_id {Faker::Number.between(from: 1, to:10)}
    state_id { Faker::Number.between(from: 1, to:5)}
    days_to_ship_id { Faker::Number.between(from: 1, to:3)}
    delivery_fee_burden_id { Faker::Number.between(from: 1, to: 2)}
    shipment_source_prefecture_id { Faker::Number.between(from: 1, to: 47)}
    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/image.png'), filename:"image.png")
    end
  end
end
