class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :product_name, :product_description, :category, :product_condition, :shipping_charge, :shipping_area, :shipping_days, :price, :user, presence: true
  validates :category_id, numericality: { other_than: 1 } 
end
