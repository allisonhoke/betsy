class MerchantsController < ApplicationController

  def show
    begin
      @merchant = Merchant.find(params[:id])
    rescue ActiveRecord::RecordNotFound => err
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end

    begin
      @products = Product.where(merchant_id: @merchant.id)
    rescue ActiveRecord::RecordNotFound => err
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end

    @merchant_oi_revenue = @merchant.find_all_order_items_revenue
  end
end
