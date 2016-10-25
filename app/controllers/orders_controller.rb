class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :purchase]
  before_action :cart, only: [:show, :edit, :update, :purchase]

  def show; end #this is the cart

  def edit; end

  def update
    if @cart.save(order_params) # REVIEW: OR order.update(order_params)
      redirect_to confirmation_path(@cart) # REVIEW: where should this redirect to??
    else
      render :edit
    end
  end

  def purchase #sends you to the confirmation page
    set_order
    @items = @cart.order_items
    @total = @cart.total

    @cart.status = "paid"
    @cart.save

    @items.each do |item|
      product = item.find_product
      product.product_purchased(item.quantity)
    end

    render :purchase # REVIEW: does this need to be here since I am clearing the session data after this?

    session.delete(:order_id) # REVIEW: clear current cart
  end

  private
    def set_order
      @cart = Order.find(session[:order_id])
    end

    def order_params
      params.require(:order).permit(:name, :email, :address, :cc_number, :expiration_date, :cvv, :zip_code)
    end

end
