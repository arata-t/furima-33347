FactoryBot.define do
  factory :item do
    description           { Faker::Lorem.sentence }
    product_name          { Faker::Lorem.words }
    category_id { 2 }
    price { 2000 }
    product_status_id        { 2 }
    burden_id                { 2 }
    area_id                  { 2 }
    days_id                  { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
