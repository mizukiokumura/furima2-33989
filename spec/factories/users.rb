FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password { "wagagunn1"}
    password_confirmation { password }
    first_name { '武田'}
    last_name   { '信玄'}
    kana_f_name { 'タケダ'}
    kana_l_name { 'シンゲン'}
    birthday {Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end