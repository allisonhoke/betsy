class Merchant < ActiveRecord::Base
  has_many :products

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :uid, :provider, presence: true

  def self.build_from_github(auth_hash)
    merchant       = Merchant.new
    merchant.uid   = auth_hash[:uid]
    merchant.provider = 'github'
    if auth_hash['info']['name'] != nil
      merchant.username  = auth_hash['info']['name']
    else
      merchant.username  = auth_hash['info']['nickname']
    end
    merchant.email = auth_hash['info']['email']

    return merchant
  end

  def find_all_order_items_revenue
    merchant = Merchant.find(self.id)

    products = Product.where(merchant_id: merchant.id)

    if products.nil?
      puts "No Revenue"
      return nil
    end

    oi_quantity = []
    product_price = []

    products.each do |product|
      order_items = OrderItem.where([:product_id] == product.id)
      order_items.each do |item|

        if product.id == item.product_id
          oi_quantity.push(item.quantity)
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

  def find_all_order_items_revenue_by_status
    merchant = Merchant.find(self.id)

    products = Product.where(merchant_id: merchant.id)

    if products.nil?
      puts "No Revenue"
      return nil
    end

    pending_subtotals = []
    paid_subtotals = []
    complete_subtotals = []

    products.each do |product|
      order_items = OrderItem.where([:product_id] == product.id)
      order_items.each do |item|
        if Order.find(item.order_id).status == 'pending'

          if product.id == item.product_id
            pending_subtotals.push(item.quantity * product.price)
          end

        elsif Order.find(item.order_id).status == 'paid'

          if product.id == item.product_id
            paid_subtotals.push(item.quantity * product.price)
          end

        elsif Order.find(item.order_id).status == 'complete'

          if product.id == item.product_id
            complete_subtotals.push(item.quantity * product.price)
          end
        end
      end
    end
    pending_revenue = pending_subtotals.reduce(:+)
    paid_revenue = paid_subtotals.reduce(:+)
    complete_revenue = complete_subtotals.reduce(:+)

    return pending_revenue, paid_revenue, complete_revenue
  end
end
