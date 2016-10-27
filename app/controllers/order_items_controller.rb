class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:update, :destroy]
  before_action :cart, only: [:create, :update, :destroy]
  skip_before_action :require_login, only: [:create, :update, :destroy]

  def create #all of this code should be refactored as a method in the model
    product = Product.find(params[:product_id])

    counter = 0
    @cart.order_items.each do |item|
      if item.product_id == product.id
        item.quantity += order_item_params(params)[:quantity].to_i
        item.save
        counter += 1
      end
    end

    if counter == 0
      @order_item = OrderItem.new
      @order_item.product_id = product.id
      @order_item.order_id = @cart.id

      @order_item.quantity = order_item_params(params)[:quantity]
      unless @order_item.save
        render :failed_order_update and return
      end
    end

      redirect_to order_path

    # end

    # @order_item = OrderItem.new
    # @order_item.product_id = product.id
    # @order_item.order_id = @cart.id
    #
    # @order_item.quantity = order_item_params(params)[:quantity]
    # if @order_item.save
    #   redirect_to order_path
    # else
    #   render :failed_order_update
    # end
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
    redirect_to order_path
  end

  private
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def order_item_params(params)
      params.require(:order_item).permit(:quantity, :product_id, :order_id)
    end
end
