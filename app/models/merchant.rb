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

    if products == []
      return nil
    end

    oi_quantity = []
    product_price = []

    products.each do |product|
      order_items = OrderItem.where(product_id: product.id)
      order_items.each do |item|
        oi_quantity.push(item.quantity)
        product_price.push(product.price)
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

    if products == []
      return nil, nil, nil
    end

    pending_subtotals = []
    paid_subtotals = []
    complete_subtotals = []

    products.each do |product|
      order_items = OrderItem.where(product_id: product.id)
      order_items.each do |item|
        if Order.find(item.order_id).status == 'pending'
          pending_subtotals.push(item.quantity * product.price)

        elsif Order.find(item.order_id).status == 'paid'
          paid_subtotals.push(item.quantity * product.price)

        elsif Order.find(item.order_id).status == 'complete'
          complete_subtotals.push(item.quantity * product.price)
        end
      end
    end

    pending_revenue = pending_subtotals.reduce(:+)
    paid_revenue = paid_subtotals.reduce(:+)
    complete_revenue = complete_subtotals.reduce(:+)

    return pending_revenue, paid_revenue, complete_revenue
  end

  def find_total_number_of_orders_by_status
    merchant = Merchant.find(self.id)

    products = Product.where(merchant_id: merchant.id)

    if products == []
      return nil, nil, nil
    end

    pending = 0
    paid = 0
    complete = 0

    products.each do |product|
      order_items = OrderItem.where(product_id: product.id)
      order_items.each do |item|
        if Order.find(item.order_id).status == 'pending'
          pending += 1

        elsif Order.find(item.order_id).status == 'paid'
          paid += 1

        elsif Order.find(item.order_id).status == 'complete'
          complete += 1
        end
      end
    end
    return pending, paid, complete
  end

  def find_orders_grouped_by_status
    merchant = Merchant.find(self.id)

    products = Product.where(merchant_id: merchant.id)

    if products == []
      return nil, nil, nil
    end

    pending_orders = []
    paid_orders = []
    complete_orders = []

    products.each do |product|
      order_items = OrderItem.where([:product_id] == product.id)
      order_items.each do |item|
        if Order.find(item.order_id).status == 'pending'
          pending_orders.push( Order.find(item.order_id))

        elsif Order.find(item.order_id).status == 'paid'
          paid_orders.push(Order.find(item.order_id))

        elsif Order.find(item.order_id).status == 'complete'
          complete_orders.push(Order.find(item.order_id))
        end
      end
    end
    return pending_orders, paid_orders, complete_orders
  end
end
