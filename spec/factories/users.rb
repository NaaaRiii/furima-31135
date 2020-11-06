FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
   end
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6, special_characters: false)
    password {password}
    password_confirmation {password}
    last_name { person.last.kanji }
    first_name { person.first.kanji }
    kana_last_name { person.last.katakana }
    kana_first_name { person.first.katakana }
    birthday { Faker::Date.backward }
  end
end