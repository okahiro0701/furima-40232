class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :category

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_explanation
    validates :price
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range", allow_blank: true}
  validates :price, numericality: { only_integer: true, message: "Half-width number." , allow_blank: true}

  with_options numericality: { other_than: 1 } do
    validates :category_id, :item_condition_id, :shipping_fee_burden_id, :prefecture_id, :delivery_time_id, numericality: {message: "can't be blank"}
  end
end
