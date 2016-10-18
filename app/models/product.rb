class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :user
  has_and_belongs_to_many :categories
end
