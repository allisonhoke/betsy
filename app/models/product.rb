class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :order_items
  has_many :orders, through: :order_items
end
