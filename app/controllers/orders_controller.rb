class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def show #confirmation screen for order details after purchasing
    @order = Order.find(params[:id])
    @items = @order.order_items
    @total = @order.total
  end

  def new

<<<<<<< HEAD
  end

=======
>>>>>>> master
  def create
    @order = Order.new(order_params)
  end
  
  def edit
  end


  def edit
    @order = Order.find(params[:id])
  end


  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to order_path(@order) # REVIEW: where should this redirect to??
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :email)
    end
end
