class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:update, :destroy]
  before_action :cart, only: [:create, :update]

  # def new
  #   product = Product.find(params[:id]).id
  #   @order_item = OrderItem.new(product_id: product)
  # end


  def create
    product = Product.find(params[:product_id])
    @order_item = OrderItem.new
    @order_item.product_id = product.id
    @order_item.order_id = @cart.id
    # @order_item.quantity = order_item_params[:quantity
    if @order_item.save(order_item_params)
      redirect_to :order_path
    else
      render :failed_order_update
    end
  end

  def update
    @order_item.update(order_item_params)
    render order_path(@cart) # REVIEW: is this correct??
  end

  def destroy
    @order_item.destroy

    redirect_to order_path(@cart)
  end

  private
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def order_item_params
      params.require(:order_item).permit(:quantity, :product_id, :order_id)
    end
end
