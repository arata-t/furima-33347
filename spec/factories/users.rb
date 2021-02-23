FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'田中'}
    first_name            {'太郎'}
    last_name_kana        {'タナカ'}
    first_name_kana       {'タロウ'}
    birth_day             {'1990-07-06'}
    
  end
end