class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :ship_date

  validates :item_name, presence: true
  validates :item_data, presence: true
  validates :price,     presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :item_category_id         , numericality: { other_than: 1, message: "can't be blank" }
  validates :item_status_id           , numericality: { other_than: 1, message: "can't be blank" }
  validates :charge_id                , numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id            , numericality: { other_than: 1, message: "can't be blank" }
  validates :ship_date_id             , numericality: { other_than: 1, message: "can't be blank" }
end
