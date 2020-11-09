class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_day

  has_one_attached :image

  validates :product_name, :product_description, :category, :product_condition, :shipping_charge, :shipping_area, :shipping_days, :price, :user, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :product_condition_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :shipping_area_id, numericality: { other_than: 1 } 
  validates :shipping_days, numericality: { other_than: 1 }
end
