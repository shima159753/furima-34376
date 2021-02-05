FactoryBot.define do
  factory :user do
    nickname                   { 'test' }
    email                      { 'test@gmail.com' }
    password                   { 'password0' }
    password_confirmation      { password }
    last_name_kanji            { '名字' }
    first_name_kanji           { '名前' }
    last_name_kana             { 'ミョウジ' }
    first_name_kana            { 'ナマエ' }
    birth_day                  { '1930-01-01 00:00:00' }
  end
end
