class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :cart, only: [:show, :edit, :update, :purchase]

  def show; end #this is the cart

  def new; end

  def create
    @order = Order.new
  end

  def edit
    set_order
  end

  def update
    set_order
    @order.email = :email
    @order.name = :name
    if @order.save # REVIEW: OR order.update(order_params)
      redirect_to order_path(@order) # REVIEW: where should this redirect to??
    else
      render :edit
    end
  end

  def purchase #sends you to the confirmation page
    set_order
    @items = @order.order_items
    @total = @cart.total

    @order.status = "purchased"
    @order.save

    @items.each do |item|
      product = item.find_product
      product.#PURCHASE 
    end

    render :purchase # REVIEW: does this need to be here since I am clearing the session data after this?

    session.delete(:order_id) # REVIEW: clear current cart
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(session[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :email, :address, :cc_number, :expiration_date, :cvv, :zip_code)
    end

end
