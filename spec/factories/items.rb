FactoryBot.define do
  factory :item do
    name                  { 'あいうえお' }
    text                  { 'かきくけこ' }
    category_id           { 2 }
    condition_id          { 2 }
    delivery_charge_id    { 2 }
    prefecture_id         { 2 }
    days_to_delivery_id   { 2 }
    price                 { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'),
                        filename: 'test_image.jpeg')
    end
  end
end
