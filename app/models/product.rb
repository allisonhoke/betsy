class Product < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: {
  only_integer: true, greater_than: 0 }


  has_many :reviews
  belongs_to :user
  has_many :products, through: :categories_products
  has_many :order_items
  has_many :orders, through: :order_items
end
