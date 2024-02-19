class ShippingFeeBurden < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '着払い(購入者負担)' },
    { id: 3, name: '送料込み(出品者負担)' }
 ] # rubocop:disable Layout/FirstArrayElementIndentation

 include ActiveHash::Associations # rubocop:disable Layout/IndentationConsistency,Layout/IndentationWidth
 has_many :items # rubocop:disable Layout/IndentationConsistency,Layout/IndentationWidth
end # rubocop:disable Layout/TrailingEmptyLines