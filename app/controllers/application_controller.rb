class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_merchant
    @current_merchant ||= Merchant.find(session[:merchant_id]) if session[:merchant_id]
  end

  def require_login
    if current_merchant.nil?
      flash[:error] = "You must be logged in to view this section"
      redirect_to root_path
    end
  end

  def cart
    begin
      @cart = Order.find(session[:order_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Order.create
      session[:order_id] = @cart.id
    end
    @items = @cart.order_items
  end
end
