FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    zip_code { '123-4567' }
    prefecture_id { 2 }
    city_name { '東京都' }
    block_number { '青山1-1-1' }
    building_name { '東京ハイツ' }
    phone_number { "09012345678" }
  end
end
