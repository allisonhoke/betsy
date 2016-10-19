class MerchantsController < ApplicationController

  def show
    begin
      @merchant = Merchant.find(params[:id])
      @products = Product.where([:merchant_id] == @merchant.id)
    rescue ActiveRecord::RecordNotFound => err
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    end
  end
end
