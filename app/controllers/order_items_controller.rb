class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:show, :edit, :update, :destroy]

  # def show
  # end
  #
  #
  # def edit
  # end
  #
  #
  def update
    @item = OrderItem.find(params[:id])
    # @item.quantity = params[:item][:qty] #added this line here
  end

  def destroy
    @item = OrderItem.find(params[:id]).destroy

    redirect_to order_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_order_item
    #   @order_item = OrderItem.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def order_item_params
    #   params.fetch(:order_item, {})
    # end
end
