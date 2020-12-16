FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    # password              {Faker::Internet.password(min_length: 6 )}
    password              { "kuroda1"}
    password_confirmation { password }
    first_name            { "黒田" }
    last_name             { "ひろき" }
    first_name_kana       { "クロタ" }
    last_name_kana        { "ヒロキ" }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end 
end