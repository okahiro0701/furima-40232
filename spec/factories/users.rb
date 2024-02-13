FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.email }
    password              { "b4" + Faker::Internet.password(min_length: 4)}
    password_confirmation { password }
    family_name           { person.first.kanji }
    first_name            { person.last.kanji }
    family_name_kana      { person.first.katakana }
    first_name_kana       { person.last.katakana }
    birth_date            { Faker::Date.backward }
  end
end
