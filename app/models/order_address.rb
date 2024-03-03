class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :zip_code, :prefecture_id, :city_name, :block_number, :building_name, :phone_number
  attr_accessor :token

  with_options presence: true do
    validates :zip_code,  format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A\d{11}\z/, message: "is invalid. disclude hyphen(-),must 11 digit,half size number"}
    validates :city_name, :block_number
    validates :token
    validates :user_id
    validates :item_id
  end

  with_options numericality: { other_than: 1 } do
    validates :prefecture_id, numericality: {message: "can't be blank"}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city_name: city_name, block_number: block_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end