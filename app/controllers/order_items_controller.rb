class OrderItemsController < ApplicationController
  before_action :set_order_item, only: [:update, :destroy]

  def update
    @order_item.update(order_item_params)
    render order_path # REVIEW: is this correct??
  end

  def destroy
    @order_item.destroy

    redirect_to order_path
  end

  private
    def set_order_item
      @order_item = OrderItem.find(params[:id])
    end

    def order_item_params
      params.require(:order_items).permit(:quantity)
    end
end
