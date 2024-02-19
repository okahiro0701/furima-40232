FactoryBot.define do
  factory :item do
    item_name {"名前"}
    item_explanation {"テスト"}
    category_id {1}
    item_condition_id {2}
    shipping_fee_burden_id {1}
    prefecture_id {1}
    delivery_time_id {1}
    price {3333}
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.png'))}
    association :user
  end
end
