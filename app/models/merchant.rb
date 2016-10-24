class Merchant < ActiveRecord::Base
  has_many :products

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :uid, :provider, presence: true

  def self.build_from_github(auth_hash)
    merchant       = Merchant.new
    merchant.uid   = auth_hash[:uid]
    merchant.provider = 'github'
    merchant.username  = auth_hash['info']['name']
    merchant.email = auth_hash['info']['email']

    return merchant
  end

  def find_all_order_items_revenue
    merchant = Merchant.find(self.id)
    products = Product.where([:merchant_id] == merchant.id)

    oi_quantity = []
    product_price = []

    products.each do |product|
      order_items = OrderItem.where([:product_id] == product.id)
      order_items.each do |item|

        if product.id == item.product_id
          oi_quantity.push(item.quantity)
        end

        if product.id == item.product_id
          product_price.push(product.price)
        end
      end
    end
    sum = 0
    oi_quantity.length.times do |i|
      sum += oi_quantity[i-1] * product_price[i-1]
    end
    return sum
  end
end
