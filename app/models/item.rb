class Item < ApplicationRecord
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :ship_date

  validates :item_name, presence: true
  validates :item_data, presence: true
  validates :price,     presence: true
  
end
