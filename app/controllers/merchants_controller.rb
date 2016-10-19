class MerchantsController < ApplicationController

  def show
    @merchant = Merchant.find(params[:id])
    @products = Product.where([:merchant_id] == @merchant.id)
  end

end
