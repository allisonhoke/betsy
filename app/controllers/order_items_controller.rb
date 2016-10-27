class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:update, :destroy]
  before_action :cart, only: [:create, :update, :destroy]
  skip_before_action :require_login, only: [:create, :update, :destroy]

  def create
    product = Product.find(params[:product_id])
    @order_item = OrderItem.new
    @order_item.product_id = product.id
    @order_item.order_id = @cart.id

    @order_item.quantity = order_item_params(params)[:quantity]
    if @order_item.save
      redirect_to order_path
    else
      render :failed_order_update
    end
  end

  def update
    @order_item.quantity = order_item_params(params)[:quantity]
    if @order_item.save
      redirect_to order_path
    else
      render :failed_order_update
    end
  end

  def destroy
    @order_item.destroy
    redirect_to order_path(@cart)
  end

  private
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def order_item_params(params)
      params.require(:order_item).permit(:quantity, :product_id, :order_id)
    end
end
