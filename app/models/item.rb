class Item < ApplicationRecord
  has_one_attached :image

  validates :item_name, presence: true
  validates :item_data, presence: true
  validates :price,     presence: true

end
