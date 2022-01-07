FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.free_email }
    password               { 'abc1234' }
    password_confirmation  { password }
    last_name              { '山田' }
    first_name             { '太郎' }
    last_name_in_kana      { 'ヤマダ' }
    first_name_in_kana     { 'タロウ' }
    date_of_birth          { '1993-06-14' }
  end
end
