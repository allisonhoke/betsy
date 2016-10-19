class Category < ActiveRecord::Base
  has_many :products, through: :categories_products

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true

end
