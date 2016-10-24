class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :cart, only: [:show, :edit, :update, :purchase]

  def show; end #this is the cart

  def new; end

  def create
    @order = Order.new(order_params)
  end

  def edit
    @order = Order.find(session[:order_id])
  end

  def update
    @order = Order.find(session[:order_id])
    # @order.email = :email
    # @order.name = :name
    if @order.update(order_params)
      redirect_to order_path(@order) # REVIEW: where should this redirect to??
    else
      render :edit
    end
  end

  def purchase #sends you to the confirmation page
    @order = Order.find(session[:order_id])
    @items = @order.order_items
    @total = @cart.total
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
