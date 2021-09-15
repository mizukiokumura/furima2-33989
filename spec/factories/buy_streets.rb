FactoryBot.define do
  factory :buy_street do
    prefecture_id { Faker::Number.betweet(from: 1, to: 46) }
    postal_code {"123-4567"}
    municipality { "東京都"}
    address {"手稲区星置"}
    building_name { "マンション"}
    phone_number { "08012345678"}
    token { "tok_abcdefghijk00000000000000000"}
  end
end
