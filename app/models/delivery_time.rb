class DeliveryTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2日で発送' },
    { id: 3, name: '2~3日で発送' },
    { id: 4, name: '4~7日で発送' }
 ] # rubocop:disable Layout/FirstArrayElementIndentation

 include ActiveHash::Associations # rubocop:disable Layout/IndentationConsistency,Layout/IndentationWidth
 has_many :items # rubocop:disable Layout/IndentationConsistency,Layout/IndentationWidth
end
