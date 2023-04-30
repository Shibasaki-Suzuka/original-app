FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { "山田" }
    first_name            { "太郎" }
    last_name_hiragana    { "やまだ" }
    first_name_hiragana   { "たろう" }
    birthday              { '1948-02-19' }
  end
end
