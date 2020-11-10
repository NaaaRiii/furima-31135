class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shipping_charge
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user

  has_one_attached :image

  validates :product_name, :product_description, :category, :product_condition, :shipping_charge, :shipping_area, :shipping_day, :price, :user, presence: true
  validates :category_id, numericality: { other_than: 1 } 
  validates :product_condition_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :shipping_area_id, numericality: { other_than: 1 } 
  validates :shipping_day_id, numericality: { other_than: 1 }

  validates :image,                 presence: true
  validates :product_name,          presence: true
  validates :category_id,           presence: true
  validates :product_condition_id,  presence: true
  validates :shipping_charge_id,    presence: true
  validates :shipping_area_id,      presence: true
  validates :shipping_day_id,       presence: true

  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :price, with: PRICE_REGEX, message: '半角数字のみ'
  validates :price, presence:true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than: 10000000}
end
