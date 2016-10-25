class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :require_login, except: [:require_login]

  def current_user
    @current_user ||= Merchant.find(session[:merchant_id]) if session[:merchant_id]
  end

  def require_login
    current_user
    if @current_user.nil?
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
