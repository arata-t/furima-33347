FactoryBot.define do
  factory :item_order do
    postal_code { '123-4567' }
    area_id { 2 }
    city { '横浜市' }
    house_num { '戸塚区' }
    building_name { 'アキバビル' }
    phone { '08012057730' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
